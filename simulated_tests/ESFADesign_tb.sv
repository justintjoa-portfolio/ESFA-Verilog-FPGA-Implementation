`timescale 1ns / 1ps
`include "ESFAOperations.vh"

module ESFADesign_tb;

    // ------------------------------------------------------------
    // Clock / reset
    // ------------------------------------------------------------

    logic clk = 1'b0;
    logic reset_n = 1'b0;

    always #5 clk = ~clk;


    // ------------------------------------------------------------
    // Top-level ESFA interface
    //
    // Important:
    // Instantiate the whole interface here, NOT EsfaDesignIO.io.
    // ESFADesign receives the .io modport view of this interface.
    // ------------------------------------------------------------

    EsfaDesignIO esfa_design_io();


    // ------------------------------------------------------------
    // DUT
    // ------------------------------------------------------------

    ESFADesign #(
        .CELL_POWER(3)
    ) dut (
        .clk(clk),
        .reset_n(reset_n),
        .esfa_design_io(esfa_design_io)
    );


    // ------------------------------------------------------------
    // Return selector to NO_OP.
    //
    // MemoryCell uses selector != prev_selector to fire an
    // operation only once. NO_OP therefore separates commands.
    // ------------------------------------------------------------

    task automatic idle_cycle();
        begin
            esfa_design_io.selector = `ESFA_NO_OP;
            @(posedge clk);
            #1;
        end
    endtask


    // ------------------------------------------------------------
    // Issue an ESFA operation.
    //
    // We hold the operation for two clock edges.
    //
    // Edge 1:
    //   MemoryCells execute the new selector and produce candidates.
    //
    // Between edges:
    //   combinator tree reduces the candidates.
    //
    // Edge 2:
    //   ESFADesign captures results needed internally, such as the
    //   available handle after FIND_AVAILABLE_CELL.
    // ------------------------------------------------------------

    task automatic issue_operation(
        input logic [7:0] operation
    );
        begin
            esfa_design_io.selector = operation;

            @(posedge clk);
            #1;

            @(posedge clk);
            #1;
        end
    endtask


    // ------------------------------------------------------------
    // Result checker
    // ------------------------------------------------------------

    task automatic check_result(
        input logic       expected_valid,
        input logic [7:0] expected_value,
        input string      message
    );
        begin

            if (esfa_design_io.resultBool !== expected_valid) begin
                $error(
                    "%s: expected valid=%0d, got valid=%0d",
                    message,
                    expected_valid,
                    esfa_design_io.resultBool
                );
                $finish;
            end

            if (
                expected_valid &&
                esfa_design_io.resultValue !== expected_value
            ) begin
                $error(
                    "%s: expected value=0x%02h, got value=0x%02h",
                    message,
                    expected_value,
                    esfa_design_io.resultValue
                );
                $finish;
            end

            $display(
                "PASS: %-30s valid=%0d value=0x%02h",
                message,
                esfa_design_io.resultBool,
                esfa_design_io.resultValue
            );

        end
    endtask


    // ------------------------------------------------------------
    // Test
    // ------------------------------------------------------------

    initial begin

        // Default external inputs
        esfa_design_io.queried_handle = 8'd0;
        esfa_design_io.new_index      = 8'd0;
        esfa_design_io.new_value      = 8'd0;
        esfa_design_io.selector       = `ESFA_NO_OP;


        $display("");
        $display("========================================");
        $display("ESFADesign end-to-end smoke test");
        $display("CELL_POWER=3 -> 8 MemoryCells");
        $display("========================================");


        // ========================================================
        // 1. RESET
        //
        // reset_n is synchronous and active-low.
        // Therefore it must be low across rising clock edges.
        // ========================================================

        reset_n = 1'b0;

        repeat (2)
            @(posedge clk);

        #1;

        reset_n = 1'b1;

        @(posedge clk);
        #1;

        $display("PASS: reset");


        // ========================================================
        // 2. FIND FIRST AVAILABLE CELL
        //
        // After reset all eight cells are free.
        //
        // The reduction tree should select the minimum available
        // physical handle:
        //
        //      min(0,1,2,3,4,5,6,7) = 0
        // ========================================================

        idle_cycle();

        issue_operation(`ESFA_FIND_AVAILABLE_CELL);

        check_result(
            1'b1,
            8'd0,
            "first available cell"
        );


        // ========================================================
        // 3. UPDATE CELL 0
        //
        // ESFADesign captured:
        //
        //      available_handle    = 0
        //      is_available_handle = 1
        //
        // during FIND_AVAILABLE_CELL.
        //
        // UPDATE therefore causes MemoryCell 0 to accept:
        //
        //      index = 0x3C
        //      value = 0xA5
        // ========================================================

        idle_cycle();

        esfa_design_io.new_index = 8'h3C;
        esfa_design_io.new_value = 8'hA5;

        issue_operation(`ESFA_UPDATE);

        $display(
            "PASS: updated handle 0 with index=0x3C value=0xA5"
        );


        // ========================================================
        // 4. FIND NEXT AVAILABLE CELL
        //
        // Cell 0 is occupied now.
        //
        // Available handles:
        //
        //      1,2,3,4,5,6,7
        //
        // Root should therefore return 1.
        // ========================================================

        idle_cycle();

        issue_operation(`ESFA_FIND_AVAILABLE_CELL);

        check_result(
            1'b1,
            8'd1,
            "second available cell"
        );


        // ========================================================
        // 5. ENCODE HANDLE 0
        //
        // LOOKUP_SCAN needs ESFADesign's internal given_code.
        //
        // Cell 0 was inserted with array_code = handle = 0.
        // ENCODE(queried_handle=0) therefore returns code 0.
        //
        // ESFADesign captures:
        //
        //      given_code    = 0
        //      is_given_code = 1
        // ========================================================

        idle_cycle();

        esfa_design_io.queried_handle = 8'd0;

        issue_operation(`ESFA_ENCODE);

        check_result(
            1'b1,
            8'd0,
            "encode handle 0"
        );


        // ========================================================
        // 6. LOOK UP INSERTED INDEX
        //
        // Cell 0 contains:
        //
        //      index = 0x3C
        //      value = 0xA5
        //      low   = 0
        //      high  = 0
        //
        // given_code is now 0 from ENCODE.
        //
        // Therefore Cell 0 should match and return 0xA5.
        // ========================================================

        idle_cycle();

        esfa_design_io.new_index = 8'h3C;

        issue_operation(`ESFA_LOOKUP_SCAN);

        check_result(
            1'b1,
            8'hA5,
            "lookup inserted value"
        );


        // ========================================================
        // 7. NEGATIVE LOOKUP
        //
        // Same code, but an index we never inserted.
        // No MemoryCell should produce a valid candidate.
        // ========================================================

        idle_cycle();

        esfa_design_io.new_index = 8'h7E;

        issue_operation(`ESFA_LOOKUP_SCAN);

        check_result(
            1'b0,
            8'h00, // ignored when expected_valid == 0
            "lookup missing index"
        );


        // ========================================================
        // DONE
        // ========================================================

        $display("");
        $display("========================================");
        $display("ALL ESFADesign SMOKE TESTS PASSED");
        $display("========================================");
        $display("");

        $finish;

    end

endmodule
