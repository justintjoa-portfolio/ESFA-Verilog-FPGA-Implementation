`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2021 06:48:28 PM
// Design Name: 
// Module Name: esfa_test
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


module esfa_test(
        
    );
    
    reg clk;
    reg willWrite;
    reg new_index;
    reg new_value;
    reg queried_handle;
    reg isHandle;
    wire resultBool;
    wire resultValue;
    reg selector;
    
    always begin
        clk = 1; #14;
        clk = 0; #14;
    end
    
    ESFADesign design(
        .clk(clk),
        .willWrite(willWrite),
        .new_index(new_index),
        .new_value(new_value),
        .queried_handle(queried_handle),
        .isHandle(isHandle),
        .resultBool(resultBool),
        .resultValue(resultValue),
        .selector(selector)
        
    );
    
    
endmodule
