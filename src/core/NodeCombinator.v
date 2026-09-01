`timescale 1ns / 1ps
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

    // ESFA operation map
    // 0 : update
    // 1 : lookupScan
    // 2 : encode
    // 3 : congrueUp
    // 4 : congrueDown
    // 5 : findAvailableCell
    // 6 : enrank
    // 7 : debug
    // 8 : no-op
    //
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


    // Operations whose tree reduction requires comparing metadata
    // from two valid candidates.
    localparam [7:0] LOOKUP_SCAN         = 8'd1;
    localparam [7:0] FIND_AVAILABLE_CELL = 8'd5;

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

                LOOKUP_SCAN: begin
                    // During lookup, metadata carries the element rank.
                    // Multiple physical elements may match because newer values
                    // can shadow older versions. Select the highest-rank candidate.
                    chooseLeft = (leftSubtreeMetadata > rightSubtreeMetadata);
                end

                FIND_AVAILABLE_CELL: begin
                    // Find available cell selects the minimum handle.
                    chooseLeft = (leftSubtreeMetadata < rightSubtreeMetadata);
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