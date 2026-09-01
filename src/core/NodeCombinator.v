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
        input[7:0] selector,

        // Candidate from the left subtree.
        input[7:0] leftSubtreeValue,
        input[7:0] leftSubtreeMetadata,
        input wire leftSubtreeValid, 

        // Candidate from the right subtree. 
        input[7:0] rightSubtreeValue,
        input[7:0] rightSubtreeMetadata,
        input wire rightSubtreeValid,

        // Candidate propagated upward in the reduction tree
        output[7:0] resultValue,
        output[7:0] resultMetadata,
        output[0:0] resultValid
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
    reg chooseLeft;


    always @ (*) begin   
        // By default, select the left subtree if it has a valid candidate.
        // If it is invalid, the right subtree is selected instead.
        chooseLeft = leftSubtreeValid;

        // If both subtrees contain valid candidates, some operations
        // require metadata comparison to determine which candidate wins.
        if (leftSubtreeValid && rightSubtreeValid) begin
            case (selector)

                `ESFA_LOOKUP_SCAN: begin
                    // During lookup, metadata carries rank.
                    // Higher-ranked matching elements shadow older versions.
                    chooseLeft =
                        (leftSubtreeMetadata > rightSubtreeMetadata);
                end

                `ESFA_FIND_AVAILABLE_CELL: begin
                    // During allocation, metadata carries the physical cell handle.
                    // Choose the lowest-numbered available cell.
                    chooseLeft =
                        (leftSubtreeMetadata < rightSubtreeMetadata);
                end

                default: begin
                    // No override; keep default selection.
                end

            endcase
        end

        
    end

    
    assign resultValid = leftSubtreeValid || rightSubtreeValid;    
    
    assign resultMetadata = chooseLeft ? leftSubtreeMetadata : rightSubtreeMetadata;
    
    assign resultValue = chooseLeft ? leftSubtreeValue : rightSubtreeValue;
    
                             
endmodule                  