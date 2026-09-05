`timescale 1ns / 1ps

`include "ESFAOperations.vh"

module MemoryCell_tb;

    logic clk;
    logic reset;

    MemoryCellInput input_signals();
    CombinatorIO result_signals();

    MemoryCell dut (
        .clk(clk),
        .reset(reset),
        .input_signals(input_signals),
        .result_signals(result_signals)
    );


    // ============================================================
    // Clock
    //
    // 100 MHz clock
    // Period = 10 ns
    // ============================================================

    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end


    // ============================================================
    // Clock helper
    // ============================================================

    task automatic tick;
        begin
            @(posedge clk);
            #1;
        end
    endtask


    // ============================================================
    // Re-arm selector
    //
    // MemoryCell executes an operation only when selector changes.
    // Moving through NO_OP allows the same operation to be issued
    // again intentionally.
    // ============================================================

    task automatic issue_no_op;
        begin
            input_signals.selector = `ESFA_NO_OP;
            tick();
        end
    endtask


    // ============================================================
    // Default all MemoryCell inputs
    // ============================================================

    task automatic set_default_inputs;
        begin
            input_signals.handle = 8'd3;
            input_signals.queried_handle = 8'd0;

            input_signals.is_available_handle = 1'b0;
            input_signals.available_handle = 8'd0;

            input_signals.inserted_index = 8'd0;
            input_signals.inserted_value = 8'd0;

            input_signals.is_given_code = 1'b0;
            input_signals.given_code = 8'd0;

            input_signals.is_given_rank = 1'b0;
            input_signals.given_rank = 8'd0;

            input_signals.selector = `ESFA_NO_OP;
        end
    endtask


    // ============================================================
    // Reset DUT
    // ============================================================

    task automatic reset_dut;
        begin
            reset = 1'b0;
            set_default_inputs();

            tick();

            reset = 1'b1;
        end
    endtask


    // ============================================================
    // Check candidate output
    // ============================================================

    task automatic check_result(
        input logic expected_valid,
        input logic [7:0] expected_value,
        input logic [7:0] expected_metadata,
        input string test_name
    );
        begin

            if (result_signals.valid !== expected_valid) begin
                $fatal(
                    1,
                    "%s: expected valid=%0d, got %0d",
                    test_name,
                    expected_valid,
                    result_signals.valid
                );
            end

            if (result_signals.value !== expected_value) begin
                $fatal(
                    1,
                    "%s: expected value=0x%02h, got 0x%02h",
                    test_name,
                    expected_value,
                    result_signals.value
                );
            end

            if (result_signals.metadata !== expected_metadata) begin
                $fatal(
                    1,
                    "%s: expected metadata=0x%02h, got 0x%02h",
                    test_name,
                    expected_metadata,
                    result_signals.metadata
                );
            end

            $display("PASS: %s", test_name);

        end
    endtask


    // ============================================================
    // Helper: populate handle 3
    //
    // Creates:
    //
    // array_code = 3
    // element defined
    // low         = 3
    // high        = 3
    // index       = 0x2A
    // value       = 0xB7
    // rank        = 1
    // ============================================================

    task automatic populate_cell;
        begin

            input_signals.available_handle = 8'd3;
            input_signals.is_available_handle = 1'b1;

            input_signals.inserted_index = 8'h2A;
            input_signals.inserted_value = 8'hB7;

            input_signals.selector = `ESFA_UPDATE;

            tick();

            issue_no_op();

        end
    endtask



    // ============================================================
    // TESTS
    // ============================================================

    initial begin


        // ========================================================
        // 1. RESET
        // ========================================================

        reset_dut();

        check_result(
            1'b0,
            8'd0,
            8'd0,
            "reset"
        );


        // ========================================================
        // 2. FIND AVAILABLE CELL
        //
        // Reset cell contains no element, so handle 3 should
        // advertise itself as available.
        // ========================================================

        input_signals.selector = `ESFA_FIND_AVAILABLE_CELL;

        tick();

        check_result(
            1'b1,
            8'd3,
            8'd3,
            "find available cell"
        );


        // ========================================================
        // 3. SUCCESSFUL UPDATE
        // ========================================================

        issue_no_op();

        input_signals.available_handle = 8'd3;
        input_signals.is_available_handle = 1'b1;

        input_signals.inserted_index = 8'h2A;
        input_signals.inserted_value = 8'hB7;

        input_signals.selector = `ESFA_UPDATE;

        tick();

        check_result(
            1'b1,
            8'd3,
            8'd3,
            "update selected cell"
        );


        // ========================================================
        // 4. POPULATED CELL IS NO LONGER AVAILABLE
        // ========================================================

        issue_no_op();

        input_signals.selector = `ESFA_FIND_AVAILABLE_CELL;

        tick();

        check_result(
            1'b0,
            8'd3,
            8'd3,
            "populated cell unavailable"
        );


        // ========================================================
        // 5. LOOKUP HIT
        //
        // UPDATE created:
        //
        // index = 0x2A
        // value = 0xB7
        // low   = 3
        // high  = 3
        // rank  = 1
        // ========================================================

        issue_no_op();

        input_signals.inserted_index = 8'h2A;

        input_signals.is_given_code = 1'b1;
        input_signals.given_code = 8'd3;

        input_signals.selector = `ESFA_LOOKUP_SCAN;

        tick();

        check_result(
            1'b1,
            8'hB7,
            8'd1,
            "lookup hit"
        );


        // ========================================================
        // 6. LOOKUP MISS — WRONG INDEX
        // ========================================================

        issue_no_op();

        input_signals.inserted_index = 8'h55;

        input_signals.selector = `ESFA_LOOKUP_SCAN;

        tick();

        if (result_signals.valid !== 1'b0) begin
            $fatal(
                1,
                "lookup wrong index: expected valid=0"
            );
        end

        $display("PASS: lookup wrong index");


        // ========================================================
        // 7. LOOKUP MISS — CODE OUTSIDE RANGE
        // ========================================================

        issue_no_op();

        input_signals.inserted_index = 8'h2A;

        input_signals.is_given_code = 1'b1;
        input_signals.given_code = 8'd4;

        input_signals.selector = `ESFA_LOOKUP_SCAN;

        tick();

        if (result_signals.valid !== 1'b0) begin
            $fatal(
                1,
                "lookup wrong code: expected valid=0"
            );
        end

        $display("PASS: lookup wrong code");


        // ========================================================
        // 8. ENCODE HIT
        //
        // handle 3 was assigned array_code 3 during UPDATE.
        // ========================================================

        issue_no_op();

        input_signals.queried_handle = 8'd3;

        input_signals.selector = `ESFA_ENCODE;

        tick();

        check_result(
            1'b1,
            8'd3,
            8'd3,
            "encode hit"
        );


        // ========================================================
        // 9. ENCODE MISS
        // ========================================================

        issue_no_op();

        input_signals.queried_handle = 8'd4;

        input_signals.selector = `ESFA_ENCODE;

        tick();

        if (result_signals.valid !== 1'b0) begin
            $fatal(
                1,
                "encode miss: expected valid=0"
            );
        end

        $display("PASS: encode miss");


        // ========================================================
        // 10. ENRANK HIT
        //
        // UPDATE initializes rank to 1.
        // ========================================================

        issue_no_op();

        input_signals.queried_handle = 8'd3;

        input_signals.selector = `ESFA_ENRANK;

        tick();

        check_result(
            1'b1,
            8'd1,
            8'd1,
            "enrank hit"
        );


        // ========================================================
        // 11. ENRANK MISS
        // ========================================================

        issue_no_op();

        input_signals.queried_handle = 8'd5;

        input_signals.selector = `ESFA_ENRANK;

        tick();

        if (result_signals.valid !== 1'b0) begin
            $fatal(
                1,
                "enrank miss: expected valid=0"
            );
        end

        $display("PASS: enrank miss");


        // ========================================================
        // 12. UPDATE WRONG HANDLE
        //
        // Reset and try to update handle 3 while claiming that
        // handle 5 was selected by FIND_AVAILABLE_CELL.
        //
        // Cell 3 must reject the update.
        // ========================================================

        reset_dut();

        input_signals.available_handle = 8'd5;
        input_signals.is_available_handle = 1'b1;

        input_signals.inserted_index = 8'h2A;
        input_signals.inserted_value = 8'hB7;

        input_signals.selector = `ESFA_UPDATE;

        tick();

        if (result_signals.valid !== 1'b0) begin
            $fatal(
                1,
                "update wrong handle: expected valid=0"
            );
        end

        $display("PASS: update wrong handle");


        // Verify it stayed empty.

        issue_no_op();

        input_signals.selector = `ESFA_FIND_AVAILABLE_CELL;

        tick();

        check_result(
            1'b1,
            8'd3,
            8'd3,
            "wrong update leaves cell available"
        );


        // ========================================================
        // 13. NO-REFIRE TEST
        //
        // This specifically verifies the purpose of prev_selector.
        //
        // Start with:
        //
        // array_code = 3
        // low        = 3
        // high       = 3
        //
        // CONGRUE_UP with given_code=2 moves those values to 4.
        //
        // We then HOLD CONGRUE_UP for multiple cycles.
        //
        // If the operation incorrectly refires:
        //
        // 3 -> 4 -> 5 -> 6
        //
        // If prev_selector works:
        //
        // 3 -> 4 -> 4 -> 4
        // ========================================================

        reset_dut();
        populate_cell();

        input_signals.is_available_handle = 1'b0;

        input_signals.is_given_code = 1'b1;
        input_signals.given_code = 8'd2;

        input_signals.is_given_rank = 1'b1;
        input_signals.given_rank = 8'd1;

        input_signals.selector = `ESFA_CONGRUE_UP;

        // First cycle: operation should execute.
        tick();

        // Hold exact same selector for two additional cycles.
        tick();
        tick();

        // Now inspect array_code through ENCODE.
        issue_no_op();

        input_signals.queried_handle = 8'd3;
        input_signals.selector = `ESFA_ENCODE;

        tick();

        check_result(
            1'b1,
            8'd4,
            8'd4,
            "selector does not refire"
        );


        // ========================================================
        // 14. BASIC CONGRUE DOWN
        //
        // Reset/populate again:
        //
        // array_code = 3
        // low        = 3
        // high       = 3
        //
        // given_code = 2
        //
        // Since code is below the interval:
        //
        // array_code -> 2
        // low        -> 2
        // high       -> 2
        // ========================================================

        reset_dut();
        populate_cell();

        input_signals.is_given_code = 1'b1;
        input_signals.given_code = 8'd2;

        // Don't delete this handle.
        input_signals.queried_handle = 8'd7;

        input_signals.selector = `ESFA_CONGRUE_DOWN;

        tick();


        // Check new array code.

        issue_no_op();

        input_signals.queried_handle = 8'd3;

        input_signals.selector = `ESFA_ENCODE;

        tick();

        check_result(
            1'b1,
            8'd2,
            8'd2,
            "congrue down adjusts array code"
        );


        // ========================================================
        // 15. Verify adjusted lookup interval after CONGRUE_DOWN
        // ========================================================

        issue_no_op();

        input_signals.inserted_index = 8'h2A;

        input_signals.is_given_code = 1'b1;
        input_signals.given_code = 8'd2;

        input_signals.selector = `ESFA_LOOKUP_SCAN;

        tick();

        check_result(
            1'b1,
            8'hB7,
            8'd1,
            "lookup after congrue down"
        );


        // ========================================================
        // DONE
        // ========================================================

        $display("");
        $display("========================================");
        $display("All MemoryCell tests passed.");
        $display("========================================");
        $display("");

        $finish;

    end

endmodule