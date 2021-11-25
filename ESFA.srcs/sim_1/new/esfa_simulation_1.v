`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2021 04:06:37 PM
// Design Name: 
// Module Name: esfa_simulation_1
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



module esfa_simulation_1();

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
        // update Basic test
        r_true <= (design.c0.new_rank == 0);
        
        //ESFAArrayOp().update(emptyArrayState, None, 0, 5)
        new_index <= 0;
        new_value <= 5;
        isHandle <= 1'b0;
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
        
        //ESFAArrayOp().update(state_and_handle._1, Some(0), 2, 10)
        new_index <= 2;
        new_value <= 10;
        isHandle <= 1'b1;
        queried_handle <= 0;
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
        r_true <= (design.c0.new_high == 1);
        
        r_true <= (design.c1.new_arrDef == 1'b1);
        r_true <= (design.c1.new_eltDef == 1'b1);
        r_true <= (design.c1.new_mark == 1'b0);
        r_true <= (design.c1.new_index == 2);
        r_true <= (design.c1.new_value == 10);
        r_true <= (design.c1.new_rank == 2);
        r_true <= (design.c1.new_low == 1);
        r_true <= (design.c1.new_high == 1);
        
        r_true <= resultBool;
        r_true <= (resultValue == 1);
        
        //ESFAArrayOp().update(state_and_handle._1, None, 4, 10)
        new_index <= 4;
        new_value <= 10;
        isHandle <= 1'b0;
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
        r_true <= (design.c0.new_high == 1);
        r_true <= (design.c0.handle == 0);
        
        r_true <= (design.c1.new_arrDef == 1'b1);
        r_true <= (design.c1.new_eltDef == 1'b1);
        r_true <= (design.c1.new_mark == 1'b0);
        r_true <= (design.c1.new_index == 2);
        r_true <= (design.c1.new_value == 10);
        r_true <= (design.c1.new_rank == 2);
        r_true <= (design.c1.new_low == 1);
        r_true <= (design.c1.new_high == 1);
        r_true <= (design.c1.handle == 1);
        
        r_true <= (design.c2.new_arrDef == 1'b1);
        r_true <= (design.c2.new_eltDef == 1'b1);
        r_true <= (design.c2.new_mark == 1'b0);
        r_true <= (design.c2.new_index == 4);
        r_true <= (design.c2.new_value == 10);
        r_true <= (design.c2.new_rank == 1);
        r_true <= (design.c2.new_low == 2);
        r_true <= (design.c2.new_high == 2);
        r_true <= (design.c2.handle == 2);
        
        r_true <= resultBool;
        r_true <= (resultValue == 2);
        
        //state_and_handle = ESFAArrayOp().update(state_and_handle._1, Some(2), 10, 21)
        new_index <= 10;
        new_value <= 21;
        isHandle <= 1'b1;
        queried_handle <= 2;
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
        r_true <= (design.c0.new_high == 1);
        r_true <= (design.c0.handle == 0);
        
        r_true <= (design.c1.new_arrDef == 1'b1);
        r_true <= (design.c1.new_eltDef == 1'b1);
        r_true <= (design.c1.new_mark == 1'b0);
        r_true <= (design.c1.new_index == 2);
        r_true <= (design.c1.new_value == 10);
        r_true <= (design.c1.new_rank == 2);
        r_true <= (design.c1.new_low == 1);
        r_true <= (design.c1.new_high == 1);
        r_true <= (design.c1.handle == 1);
        
        r_true <= (design.c3.new_arrDef == 1'b1);
        r_true <= (design.c3.new_eltDef == 1'b1);
        r_true <= (design.c3.new_mark == 1'b0);
        r_true <= (design.c3.new_index == 10);
        r_true <= (design.c3.new_value == 21);
        r_true <= (design.c3.new_rank == 2);
        r_true <= (design.c3.new_low == 3);
        r_true <= (design.c3.new_high == 3);
        r_true <= (design.c3.handle == 3);
        
        r_true <= (design.c2.new_arrDef == 1'b1);
        r_true <= (design.c2.new_eltDef == 1'b1);
        r_true <= (design.c2.new_mark == 1'b0);
        r_true <= (design.c2.new_index == 4);
        r_true <= (design.c2.new_value == 10);
        r_true <= (design.c2.new_rank == 1);
        r_true <= (design.c2.new_low == 2);
        r_true <= (design.c2.new_high == 3);
        r_true <= (design.c2.handle == 2);
        
        r_true <= resultBool;
        r_true <= (resultValue == 3);
        
        //ESFAArrayOp().update(state_and_handle._1, Some(1), 9, 5)
        new_index <= 9;
        new_value <= 5;
        isHandle <= 1'b1;
        queried_handle <= 1;
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
        r_true <= (design.c0.new_high == 2);
        r_true <= (design.c0.handle == 0);
        r_true <= (design.c0.new_array_code == 0);
        
        r_true <= (design.c1.new_arrDef == 1'b1);
        r_true <= (design.c1.new_eltDef == 1'b1);
        r_true <= (design.c1.new_mark == 1'b0);
        r_true <= (design.c1.new_index == 2);
        r_true <= (design.c1.new_value == 10);
        r_true <= (design.c1.new_rank == 2);
        r_true <= (design.c1.new_low == 1);
        r_true <= (design.c1.new_high == 2);
        r_true <= (design.c1.handle == 1);
        r_true <= (design.c1.new_array_code == 1);
        
        r_true <= (design.c3.new_arrDef == 1'b1);
        r_true <= (design.c3.new_eltDef == 1'b1);
        r_true <= (design.c3.new_mark == 1'b0);
        r_true <= (design.c3.new_index == 10);
        r_true <= (design.c3.new_value == 21);
        r_true <= (design.c3.new_rank == 2);
        r_true <= (design.c3.new_low == 4);
        r_true <= (design.c3.new_high == 4);
        r_true <= (design.c3.handle == 3);
        r_true <= (design.c3.array_code == 4);
        
        r_true <= (design.c2.new_arrDef == 1'b1);
        r_true <= (design.c2.new_eltDef == 1'b1);
        r_true <= (design.c2.new_mark == 1'b0);
        r_true <= (design.c2.new_index == 4);
        r_true <= (design.c2.new_value == 10);
        r_true <= (design.c2.new_rank == 1);
        r_true <= (design.c2.new_low == 3);
        r_true <= (design.c2.new_high == 4);
        r_true <= (design.c2.handle == 2);
        r_true <= (design.c2.new_array_code == 3);
        
        r_true <= (design.c4.new_arrDef == 1'b1);
        r_true <= (design.c4.new_eltDef == 1'b1);
        r_true <= (design.c4.new_mark == 1'b0);
        r_true <= (design.c4.new_index == 9);
        r_true <= (design.c4.new_value == 5);
        r_true <= (design.c4.new_rank == 3);
        r_true <= (design.c4.new_low == 2);
        r_true <= (design.c4.new_high == 2);
        r_true <= (design.c4.handle == 4);
        r_true <= (design.c4.array_code == 2);
        
        r_true <= resultBool;
        r_true <= (resultValue == 4);
        
        //ESFAArrayOp().update(state_and_handle._1, Some(1), 11, 14)
        new_index <= 11;
        new_value <= 14;
        isHandle <= 1'b1;
        queried_handle <= 1;
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
        r_true <= (design.c0.new_high == 3);
        r_true <= (design.c0.handle == 0);
        r_true <= (design.c0.new_array_code == 0);
        
        r_true <= (design.c1.new_arrDef == 1'b1);
        r_true <= (design.c1.new_eltDef == 1'b1);
        r_true <= (design.c1.new_mark == 1'b0);
        r_true <= (design.c1.new_index == 2);
        r_true <= (design.c1.new_value == 10);
        r_true <= (design.c1.new_rank == 2);
        r_true <= (design.c1.new_low == 1);
        r_true <= (design.c1.new_high == 3);
        r_true <= (design.c1.handle == 1);
        r_true <= (design.c1.new_array_code == 1);
        
        r_true <= (design.c3.new_arrDef == 1'b1);
        r_true <= (design.c3.new_eltDef == 1'b1);
        r_true <= (design.c3.new_mark == 1'b0);
        r_true <= (design.c3.new_index == 10);
        r_true <= (design.c3.new_value == 21);
        r_true <= (design.c3.new_rank == 2);
        r_true <= (design.c3.new_low == 5);
        r_true <= (design.c3.new_high == 5);
        r_true <= (design.c3.handle == 3);
        r_true <= (design.c3.array_code == 5);
        
        r_true <= (design.c2.new_arrDef == 1'b1);
        r_true <= (design.c2.new_eltDef == 1'b1);
        r_true <= (design.c2.new_mark == 1'b0);
        r_true <= (design.c2.new_index == 4);
        r_true <= (design.c2.new_value == 10);
        r_true <= (design.c2.new_rank == 1);
        r_true <= (design.c2.new_low == 4);
        r_true <= (design.c2.new_high == 5);
        r_true <= (design.c2.handle == 2);
        r_true <= (design.c2.new_array_code == 4);
        
        r_true <= (design.c4.new_arrDef == 1'b1);
        r_true <= (design.c4.new_eltDef == 1'b1);
        r_true <= (design.c4.new_mark == 1'b0);
        r_true <= (design.c4.new_index == 9);
        r_true <= (design.c4.new_value == 5);
        r_true <= (design.c4.new_rank == 3);
        r_true <= (design.c4.new_low == 3);
        r_true <= (design.c4.new_high == 3);
        r_true <= (design.c4.handle == 4);
        r_true <= (design.c4.array_code == 3);
        
        r_true <= (design.c5.new_arrDef == 1'b1);
        r_true <= (design.c5.new_eltDef == 1'b1);
        r_true <= (design.c5.new_mark == 1'b0);
        r_true <= (design.c5.new_index == 11);
        r_true <= (design.c5.new_value == 14);
        r_true <= (design.c5.new_rank == 3);
        r_true <= (design.c5.new_low == 2);
        r_true <= (design.c5.new_high == 2);
        r_true <= (design.c5.handle == 5);
        r_true <= (design.c5.array_code == 2);
        
        r_true <= resultBool;
        r_true <= (resultValue == 5);
        
        // ESFAArrayOp().lookUp(state_and_handle._1, 0, 0)
        new_index <= 0;
        isHandle <= 1'b1;
        queried_handle <= 0;
        selector <= 3;
        #28;
        selector <= 1;
        #28;
        selector <= 2;
        #28;
        
        r_true <= resultBool;
        r_true <= (resultValue == 5);
        
        //ESFAArrayOp().lookUp(state_and_handle._1, 1, 0)
        new_index <= 0;
        isHandle <= 1'b1;
        queried_handle <= 1;
        selector <= 3;
        #28;
        selector <= 1;
        #28;
        selector <= 2;
        #28;
        
        r_true <= resultBool;
        r_true <= (resultValue == 5);
        
        //ESFAArrayOp().lookUp(state_and_handle._1, 1, 2) 
        new_index <= 2;
        isHandle <= 1'b1;
        queried_handle <= 1;
        selector <= 3;
        #28;
        selector <= 1;
        #28;
        selector <= 2;
        #28;
        
        r_true <= resultBool;
        r_true <= (resultValue == 10);
        
        //ESFAArrayOp().lookUp(state_and_handle._1, 3, 4)
        new_index <= 4;
        isHandle <= 1'b1;
        queried_handle <= 3;
        selector <= 3;
        #28;
        selector <= 1;
        #28;
        selector <= 2;
        #28;
        
        r_true <= resultBool;
        r_true <= (resultValue == 10);
        
        //ESFAArrayOp().lookUp(state_and_handle._1, 5, 2)
        new_index <= 2;
        isHandle <= 1'b1;
        queried_handle <= 5;
        selector <= 3;
        #28;
        selector <= 1;
        #28;
        selector <= 2;
        #28;
        
        r_true <= resultBool;
        r_true <= (resultValue == 10);
        
        //ESFAArrayOp().lookUp(state_and_handle._1, 5, 1)
        new_index <= 1;
        isHandle <= 1'b1;
        queried_handle <= 5;
        selector <= 3;
        #28;
        selector <= 1;
        #28;
        selector <= 2;
        #28;
        
        r_true <= (resultBool == 0); //there is no value with index 1 in sixth array
        
        //ESFAArrayOp().delete(state_and_handle._1, 1)
        isHandle <= 1'b1;
        queried_handle <= 1;
        selector <= 4;
        willWrite <= 1;
        #28;
        selector <= 6;
        #28;
        willWrite <= 0;
        r_true <= (design.c0.new_arrDef == 1'b1);
        r_true <= (design.c0.new_eltDef == 1'b1);
        r_true <= (design.c0.new_mark == 1'b0);
        r_true <= (design.c0.new_index == 0);
        r_true <= (design.c0.new_value == 5);
        r_true <= (design.c0.new_rank == 1);
        r_true <= (design.c0.new_low == 0);
        r_true <= (design.c0.new_high == 2);
        r_true <= (design.c0.handle == 0);
        r_true <= (design.c0.new_array_code == 0);
        
        r_true <= (design.c1.new_arrDef == 1'b0);
        r_true <= (design.c1.new_eltDef == 1'b1);
        r_true <= (design.c1.new_mark == 1'b0);
        r_true <= (design.c1.new_index == 2);
        r_true <= (design.c1.new_value == 10);
        r_true <= (design.c1.new_rank == 0);
        r_true <= (design.c1.new_low == 1);
        r_true <= (design.c1.new_high == 2);
        r_true <= (design.c1.handle == 1);
        r_true <= (design.c1.new_array_code == 1);
        
        r_true <= (design.c3.new_arrDef == 1'b1);
        r_true <= (design.c3.new_eltDef == 1'b1);
        r_true <= (design.c3.new_mark == 1'b0);
        r_true <= (design.c3.new_index == 10);
        r_true <= (design.c3.new_value == 21);
        r_true <= (design.c3.new_rank == 2);
        r_true <= (design.c3.new_low == 4);
        r_true <= (design.c3.new_high == 4);
        r_true <= (design.c3.handle == 3);
        r_true <= (design.c3.array_code == 4);
        
        r_true <= (design.c2.new_arrDef == 1'b1);
        r_true <= (design.c2.new_eltDef == 1'b1);
        r_true <= (design.c2.new_mark == 1'b0);
        r_true <= (design.c2.new_index == 4);
        r_true <= (design.c2.new_value == 10);
        r_true <= (design.c2.new_rank == 1);
        r_true <= (design.c2.new_low == 3);
        r_true <= (design.c2.new_high == 4);
        r_true <= (design.c2.handle == 2);
        r_true <= (design.c2.new_array_code == 3);
        
        r_true <= (design.c4.new_arrDef == 1'b1);
        r_true <= (design.c4.new_eltDef == 1'b1);
        r_true <= (design.c4.new_mark == 1'b0);
        r_true <= (design.c4.new_index == 9);
        r_true <= (design.c4.new_value == 5);
        r_true <= (design.c4.new_rank == 3);
        r_true <= (design.c4.new_low == 2);
        r_true <= (design.c4.new_high == 2);
        r_true <= (design.c4.handle == 4);
        r_true <= (design.c4.array_code == 2);
        
        r_true <= (design.c5.new_arrDef == 1'b1);
        r_true <= (design.c5.new_eltDef == 1'b1);
        r_true <= (design.c5.new_mark == 1'b0);
        r_true <= (design.c5.new_index == 11);
        r_true <= (design.c5.new_value == 14);
        r_true <= (design.c5.new_rank == 3);
        r_true <= (design.c5.new_low == 1);
        r_true <= (design.c5.new_high == 1);
        r_true <= (design.c5.handle == 5);
        r_true <= (design.c5.array_code == 1);
        
        //ESFAArrayOp().delete(post_deletion_state, 4)
        isHandle <= 1'b1;
        queried_handle <= 4;
        selector <= 4;
        willWrite <= 1;
        #28;
        selector <= 6;
        #28;
        willWrite <= 0;
        
        //ESFAArrayOp().delete(post_deletion_state, 5)
        isHandle <= 1'b1;
        queried_handle <= 5;
        selector <= 4;
        willWrite <= 1;
        #28;
        selector <= 6;
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
        r_true <= (design.c0.handle == 0);
        r_true <= (design.c0.new_array_code == 0);
        
        r_true <= (design.c1.new_arrDef == 1'b0);
        r_true <= (design.c1.new_eltDef == 1'b0);
        r_true <= (design.c1.new_mark == 1'b0);
        
        r_true <= (design.c3.new_arrDef == 1'b1);
        r_true <= (design.c3.new_eltDef == 1'b1);
        r_true <= (design.c3.new_mark == 1'b0);
        r_true <= (design.c3.new_index == 10);
        r_true <= (design.c3.new_value == 21);
        r_true <= (design.c3.new_rank == 2);
        r_true <= (design.c3.new_low == 2);
        r_true <= (design.c3.new_high == 2);
        r_true <= (design.c3.handle == 3);
        r_true <= (design.c3.array_code == 2);
        
        r_true <= (design.c2.new_arrDef == 1'b1);
        r_true <= (design.c2.new_eltDef == 1'b1);
        r_true <= (design.c2.new_mark == 1'b0);
        r_true <= (design.c2.new_index == 4);
        r_true <= (design.c2.new_value == 10);
        r_true <= (design.c2.new_rank == 1);
        r_true <= (design.c2.new_low == 1);
        r_true <= (design.c2.new_high == 2);
        r_true <= (design.c2.handle == 2);
        r_true <= (design.c2.new_array_code == 1);
        
        r_true <= (design.c4.new_arrDef == 1'b0);
        r_true <= (design.c4.new_eltDef == 1'b0);
        r_true <= (design.c4.new_mark == 1'b0);
        
        r_true <= (design.c5.new_arrDef == 1'b0);
        r_true <= (design.c5.new_eltDef == 1'b0);
        r_true <= (design.c5.new_mark == 1'b0);

        //ESFAArrayOp().lookUp(post_deletion_state, 0, 0) 
        new_index <= 0;
        isHandle <= 1'b1;
        queried_handle <= 0;
        selector <= 3;
        #28;
        selector <= 1;
        #28;
        selector <= 2;
        #28;
        
        r_true <= resultBool;
        r_true <= (resultValue == 5);
        
        
    end
endmodule
