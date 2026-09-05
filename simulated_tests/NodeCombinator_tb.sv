`timescale 1ns / 1ps

`include "ESFAOperations.vh"


module NodeCombinator_tb(
    );


    typedef struct packed {
        logic enabled; 
        logic [7:0] selector;

        logic [7:0] leftValue;
        logic [7:0] leftMetadata;
        logic       leftValid;

        logic [7:0] rightValue;
        logic [7:0] rightMetadata;
        logic       rightValid;

        logic [7:0] expectedValue;
        logic [7:0] expectedMetadata;
        logic       expectedValid;
    } test_vector;

    localparam string vectorFilePath = "tests/vectors/NodeCombinator_tb.txt";
    localparam int timeToSettle = 1;
    localparam int VECTOR_WIDTH = $bits(test_vector);

    localparam int MAX_VECTORS = 256;
    logic [VECTOR_WIDTH-1:0] testVectors [0:MAX_VECTORS-1];
    test_vector currentVector;

    // Relevant signals
    logic [7:0] selector;
    CombinatorIO leftSubtree();
    CombinatorIO rightSubtree();
    CombinatorIO result();
    
    
    NodeCombinator dut(
        .selector(selector),
        .leftSubtree(leftSubtree),
        .rightSubtree(rightSubtree),
        .result(result)
    );
    
    task initialize_inputs;
    begin  
        selector = `ESFA_NO_OP;
        leftSubtree.value = 8'b0;
        leftSubtree.metadata = 8'b0;
        leftSubtree.valid = 1'b0;
        rightSubtree.value = 8'b0;
        rightSubtree.metadata = 8'b0;
        rightSubtree.valid = 1'b0;
    end
    endtask
    
    
        initial begin   
            foreach (testVectors[i])
                testVectors[i] = '0;

            // Load vectors from the hex file.
            $readmemb(
                vectorFilePath,
                testVectors
            );

            initialize_inputs();

            foreach (testVectors[i]) begin

                currentVector = test_vector'(testVectors[i]);

                if (!currentVector.enabled)
                    break;

                selector = currentVector.selector;

                leftSubtree.value =
                    currentVector.leftValue;

                leftSubtree.metadata =
                    currentVector.leftMetadata;

                leftSubtree.valid =
                    currentVector.leftValid;

                rightSubtree.value =
                    currentVector.rightValue;

                rightSubtree.metadata =
                    currentVector.rightMetadata;

                rightSubtree.valid =
                    currentVector.rightValid;

                #timeToSettle;

                assert(result.value == currentVector.expectedValue)
                else $fatal(
                    "Vector %0d: value expected=%0d actual=%0d",
                    i,
                    currentVector.expectedValue,
                    result.value
                );

                assert(result.metadata == currentVector.expectedMetadata)
                else $fatal(
                    "Vector %0d: metadata expected=%0d actual=%0d",
                    i,
                    currentVector.expectedMetadata,
                    result.metadata
                );

                assert(result.valid == currentVector.expectedValid)
                else $fatal(
                    "Vector %0d: valid expected=%0d actual=%0d",
                    i,
                    currentVector.expectedValid,
                    result.valid
                );

            end

            $finish;
        end
    
endmodule
