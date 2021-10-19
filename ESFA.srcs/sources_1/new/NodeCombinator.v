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
        input clk,
        input selector,
        input resultValue1,
        input resultContext1,
        input resultBool1,
        input resultValue2,
        input resultContext2,
        input resultBool2,
        output resultValue,
        output resultContext,
        output resultBool
    );
    
    reg r_resultValue;
    reg r_resultContext;
    reg r_resultBool;
    
    assign resultValue = r_resultValue;
    assign resultContext = r_resultContext;
    assign resultBool = r_resultBool;
    
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
    
    always @ (posedge clk)
        begin
            r_resultBool = resultBool1 || resultBool2;
            if (selector == 2) begin
                if (resultBool1 && resultBool2) begin
                   if (resultContext1 > resultContext2) begin
                        r_resultContext = resultContext1;
                        r_resultValue = resultValue1;
                   end else begin
                        r_resultContext = resultContext2;
                        r_resultValue = resultValue2;
                   end
                end else begin 
                    if (resultBool1)
                        r_resultContext = resultContext1;
                        r_resultValue = r_resultValue1;
                    if (resultBool2)
                        r_resultContext = resultContext2;
                        r_resultValue = r_resultValue2;
                end
             end else if (selector == 7) begin
                if (resultBool1 && resultBool2) begin
                   if (resultContext1 < resultContext2) begin
                        r_resultContext = resultContext1;
                        r_resultValue = resultValue1;
                   end else begin
                        r_resultContext = resultContext2;
                        r_resultValue = resultValue2;
                   end
                end else begin 
                    if (resultBool1) begin
                        r_resultContext = resultContext1;
                        r_resultValue = r_resultValue1;
                    end
                    if (resultBool2) begin
                        r_resultContext = resultContext2;
                        r_resultValue = r_resultValue2;
                    end
                end
             end else begin
                    if (resultBool1) begin
                        r_resultValue = resultValue1;
                        r_resultContext = resultContext1;
                    end
                    if (resultBool2) begin
                        r_resultValue = resultValue2;
                        r_resultContext = resultContext2;
                    end
             end
      end
endmodule
