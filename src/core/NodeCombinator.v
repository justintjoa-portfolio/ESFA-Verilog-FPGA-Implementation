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

        // Candidate from the left Subtree.
        input[7:0] leftSubtreeValue,
        input[7:0] leftSubtreeMetadata,
        input[0:0] leftSubtreeValid, 

        // Candidate from the right Subtree. 
        input[7:0] rightSubtreeValue,
        input[7:0] rightSubtreeMetadata,
        input[0:0] rightSubtreeValid,

        // Candidate propagated upward in the reduction tree
        output[7:0] resultValue,
        output[7:0] resultMetadata,
        output[0:0] resultBool
    );

    
    // Operations whose tree reduction requires comparing metadata
    // from two valid candidates.
    localparam [7:0] LOOKUP_SCAN = 8'd1;
    localparam [7:0] CONGRUE_UP  = 8'd5;

    // True when the left candidate should be the one to propagate down the tree.
    reg chooseLeft;


    always @ (*) begin   
        // Initialize chooseLeft to whether or not we even have a feasible
        // left Subtree. If it's not feasible don't pick it. 
        chooseLeft = leftSubtreeValid

        // Both subtrees are viable - we have to break the tie when 
        // applicable.
        if (leftSubtreeValid && rightSubtreeValid) begin
            case (selector)

                LOOKUP_SCAN: begin
                    // Higher-ranked element is the most recent version.
                    chooseLeft = (resultMetadata1 > resultMetadata2);
                end

                CONGRUE_UP: begin
                    // Congruence reduction selects the lower Metadata.
                    chooseLeft = (resultMetadata1 < resultMetadata2);
                end

                default: begin
                    // No override; keep default selection.
                end

            endcase
        end

        
    end

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
    
    assign resultBool = leftSubtreeValid || rightSubtreeValid;
    
    wire[0:0] isLeft;
    assign isLeft = ((leftSubtreeValid && rightSubtreeValid) && (selector == 8'b1 || selector == 8'b101))? 
                          (selector == 1) ? 
                                (leftSubtreeMetadata > rightSubtreeMetadata) ?
                                    1'b1 
                                    : 1'b0
                                 : (leftSubtreeMetadata < rightSubtreeMetadata) ?
                                    1'b1  
                                    : 1'b0          
                          : leftSubtreeValid? 
                            1'b1 
                            : 1'b0;

    
    
    assign resultMetadata = chooseleft ? leftSubtreeMetadata : rightSubtreeMetadata;
    
    assign resultValue = chooseleft ? leftSubtreeValue : rightSubtreeValue;
    
                             
endmodule                  