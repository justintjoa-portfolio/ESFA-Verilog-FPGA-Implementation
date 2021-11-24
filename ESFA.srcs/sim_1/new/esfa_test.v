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

module assert(input clk, input test);
    always @(posedge clk)
    begin
        if (test !== 1)
        begin
            $display("ASSERTION FAILED in %m");
            $finish;
        end
    end
endmodule


module esfa_test(
        
    );
    
    reg clk;
    reg willWrite = 0;
    reg new_index;
    reg new_value;
    reg queried_handle;
    reg isHandle;
    wire resultBool;
    wire resultValue;
    reg selector;
    
    reg r_true = 1;
    wire is_true;
    assign is_true = r_true;
    
    always begin
        clk = 1; #14;
        clk = 0; #14;
    end
    
 
    assert a0(.clk(clk), .test(is_true));
    
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
    
    initial
    begin
        r_true <= (design.c0.new_rank == 0);
        new_index <= 0;
        new_value <= 5;
        is_handle <= 1'b0;
        selector <= 3;
        willWrite <= 1;
        #28;
        selector <= 7;
        #28;
        selector <= 0;
        #28;
        selector <= 5;
        #28;
        willWrite <= 0;
        r_true <= (design.c0.new_arrDef == 1'b1);
        r_true <= (design.c0.new_eltDef == 1'b1);
        r_true <= (design.c0.new_mark == 1'b0);
        r_true <= (design.c0.new_index == 0);
        r_true <= (design.c0.new_value == 5);
        r_true <= (design.c0.new_rank == 1);
        r_true <= (design.c0.new_low == 0);
        r_true <= (design.c0.new_high == 0);
        r_true <= resultBool;
        r_true <= (resultValue == 0);
    end
    
    
endmodule
