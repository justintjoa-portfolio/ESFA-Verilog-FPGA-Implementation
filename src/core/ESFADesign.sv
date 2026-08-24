`timescale 1ns / 1ps
`include "ESFAOperations.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2021 08:53:11 PM
// Design Name: 
// Module Name: ESFADesign
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ESFADesign #(parameter int CELL_POWER = 3)
(
    input logic clk, 
    // Note - synchronous reset is active low. 
    input logic reset_n,
    ESFADesignIO.io io 
);
    
    localparam int NUM_CELLS = 1 << CELL_POWER;
    // We need as many inputs as we need memory cells.
    MemoryCellInput cell_inputs [NUM_CELLS]();
    // This is the number of combinator io we need to connect our memory cells/combinators.
    // They're going to be stored from left to right from level - ie for 8 cells, 
    // we got 8, then 4, then 2, then 1. So we need 8 + 4 + 2 + 1 = 15 combinator io.
    localparam int NUM_COMBINATOR_IO = 2 * NUM_CELLS - 1;
    CombinatorIO tree_io [NUM_COMBINATOR_IO]();
    // Assigin the output of ESFADesign to that of the last combinator. 
    assign io.resultBool = tree_io[NUM_COMBINATOR_IO - 1].valid;
    assign io.resultValue = tree_io[NUM_COMBINATOR_IO - 1].value;

    reg[7:0] given_code;
    reg[7:0] given_rank;
    reg[7:0] available_handle;
    reg[0:0] is_given_code;
    reg[0:0] is_given_rank;
    reg[0:0] is_available_handle;
    reg[7:0] combinator_selector;
    
    reg[7:0] given_code_next;
    reg[7:0] given_rank_next;
    reg[7:0] available_handle_next;
    reg[0:0] is_given_code_next;
    reg[0:0] is_given_rank_next;
    reg[0:0] is_available_handle_next;
    reg[7:0] combinator_selector_next;

    begin : cell_input_assignment
        for (genvar i = 0; i < NUM_CELLS; i++) begin 
            assign cell_inputs[i].handle = i;

            assign cell_inputs[i].queried_handle =
                io.queried_handle;

            assign cell_inputs[i].is_available_handle =
                is_available_handle;

            assign cell_inputs[i].available_handle =
                available_handle;

            assign cell_inputs[i].inserted_index =
                io.new_index;

            assign cell_inputs[i].inserted_value =
                io.new_value;

            assign cell_inputs[i].is_given_code =
                is_given_code;

            assign cell_inputs[i].given_code =
                given_code;

            assign cell_inputs[i].is_given_rank =
                is_given_rank;

            assign cell_inputs[i].given_rank =
                given_rank;

            assign cell_inputs[i].selector =
                io.selector;

        end
    end


    for (genvar i = 0; i < NUM_CELLS; i++) begin : memory_cell_instances

        MemoryCell #(
            .MAX_HANDLE(NUM_CELLS - 1)
        ) mem_cell (
            .clk(clk),
            .reset(reset_n),
            .input_signals(cell_inputs[i]),
            .result_signals(tree_io[i])
        );

    end

    // Helper function to get the starting index of a level in the tree io array.
    function automatic int level_start_index_helper(
        input int level
    );
        int start = 0;

        for (int i = 0; i < level; i++) begin
            start += NUM_CELLS >> i;
        end

        return start;
    endfunction

    begin : tree_generation
        for (genvar i = 1; i < CELL_POWER + 1; i++) begin 
            // This is the nth level we are above the leaves which are the memory cell outputs (inclusive of 
            // the memory cell outputs themselves).
            // (Dr. O'Donnell considers the leaves to be the memory cells themselves, it ends up
            // working the same logically).

            localparam int NUM_COMBINATORS_ON_LEVEL =
                NUM_CELLS >> (i);

            localparam int PREVIOUS_LEVEL_START = level_start_index_helper(i-1);

            localparam int CURRENT_LEVEL_START = level_start_index_helper(i);

            

            for (genvar j = 0; j < NUM_COMBINATORS_ON_LEVEL; j++) begin 
                NodeCombinator combinator (
                    .selector(combinator_selector),
                    .leftSubtree(tree_io[PREVIOUS_LEVEL_START + 2*j]),
                    .rightSubtree(tree_io[PREVIOUS_LEVEL_START + 2*j + 1]),
                    .result(tree_io[CURRENT_LEVEL_START + j])
                );
            end
        end
    end


    
    always @ (posedge clk)
        begin
            if (reset_n == 1'b0) begin
                    given_code <= 0;
                    given_rank <= 0;
                    available_handle <= 0;
                    is_given_code <= 0;
                    is_available_handle <= 0;
                    is_given_rank <= 0;
                    combinator_selector <= `ESFA_NO_OP;
             end else begin   
                    given_code <= given_code_next; 
                    given_rank <= given_rank_next;  
                    available_handle <= available_handle_next;
                    is_given_code <= is_given_code_next; 
                    is_given_rank <= is_given_rank_next; 
                    is_available_handle <= is_available_handle_next;
                    combinator_selector <= combinator_selector_next;
             end
              
        end
        
   always @ (*) begin   
        given_code_next = given_code;
        given_rank_next = given_rank;
        available_handle_next = available_handle;
        is_given_code_next = is_given_code;
        is_given_rank_next = is_given_rank;
        is_available_handle_next = is_available_handle;
        combinator_selector_next = combinator_selector;
        case (io.selector)
             `ESFA_ENCODE: begin  
                  given_code_next = io.resultValue;
                  is_given_code_next = io.resultBool;
             end
             `ESFA_FIND_AVAILABLE_CELL: begin 
                 available_handle_next = io.resultValue;
                 is_available_handle_next = io.resultBool;
              end
              `ESFA_ENRANK:begin 
                  given_rank_next = io.resultValue;
                  is_given_rank_next = io.resultBool;
              end
        endcase
        if (!(io.selector == `ESFA_NO_OP)) begin   
            combinator_selector_next = io.selector;
        end
   end
   
      
endmodule
