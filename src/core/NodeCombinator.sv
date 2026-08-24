`timescale 1ns / 1ps
`include "ESFAOperations.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2021 08:46:51 PM
// Design Name: 
// Module Name: NodeCombinator
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

module NodeCombinator(
        input logic [7:0] selector,

        // Candidate from the left subtree.
        CombinatorIO.in leftSubtree,

        // Candidate from the right subtree. 
        CombinatorIO.in rightSubtree,

        // Candidate propagated upward in the reduction tree
        CombinatorIO.out result
    );
    
    // NodeCombinator special reductions:
    //   lookupScan (1):
    //     metadata = element rank
    //     selects MAX rank to resolve shadowed elements.
    //
    //   findAvailableCell (5):
    //     metadata = physical MemoryCell handle
    //     selects MIN handle to choose an available cell.
    //
    // All other operations use normal valid-candidate propagation.

    // True when the left candidate should propagate upward toward the root.
    logic chooseLeft;


    always_comb begin   
        // By default, select the left subtree if it has a valid candidate.
        // If it is invalid, the right subtree is selected instead.
        chooseLeft = leftSubtree.valid;

        // If both subtrees contain valid candidates, some operations
        // require metadata comparison to determine which candidate wins.
        if (leftSubtree.valid && rightSubtree.valid) begin
            case (selector)

                `ESFA_LOOKUP_SCAN: begin
                    // During lookup, metadata carries rank.
                    // Higher-ranked matching elements shadow older versions.
                    chooseLeft =
                        (leftSubtree.metadata > rightSubtree.metadata);
                end

                `ESFA_FIND_AVAILABLE_CELL: begin
                    // During allocation, metadata carries the physical cell handle.
                    // Choose the lowest-numbered available cell.
                    chooseLeft =
                        (leftSubtree.metadata < rightSubtree.metadata);
                end

                default: begin
                    // No override; keep default selection.
                end

            endcase
        end

        
    end

    
    assign result.valid = leftSubtree.valid || rightSubtree.valid;    
    
    assign result.metadata = chooseLeft ? leftSubtree.metadata : rightSubtree.metadata;
    
    assign result.value = chooseLeft ? leftSubtree.value : rightSubtree.value;
    
                             
endmodule                  