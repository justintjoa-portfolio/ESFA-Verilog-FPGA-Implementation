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
        input[7:0] resultValue1,
        input[7:0] resultContext1,
        input[0:0] resultBool1,
        input[7:0] resultValue2,
        input[7:0] resultContext2,
        input[0:0] resultBool2,
        output[7:0] resultValue,
        output[7:0] resultContext,
        output[0:0] resultBool 
    );

    
    //Map
    // 0 : update  
    // 1 : lookUpScan    
    // 2 : lookUpFinalizer   
    // 3: encode      
    // 4: delete   
    // 5: congrueUp  
    // 6: congruedown 
    // 7: markAvailableCell
    
    // selector 5 and 6 act as a void
    
    assign resultBool = resultBool1 || resultBool2;
    
    wire[0:0] isLeft;
    assign isLeft = ((resultBool1 && resultBool2) && (selector == 1 || selector == 5))? 
                          (selector == 1) ? 
                                (resultContext1 > resultContext2) ?
                                    1'b1 
                                    : 1'b0
                                 : (resultContext1 < resultContext2) ?
                                    1'b1  
                                    : 1'b0          
                          : resultBool1? 
                            1'b1 
                            : 1'b0;

    
    
    assign resultContext = isLeft ? resultContext1 : resultContext2;
    
    assign resultValue = isLeft ? resultValue1 : resultValue2;
                             
endmodule                  