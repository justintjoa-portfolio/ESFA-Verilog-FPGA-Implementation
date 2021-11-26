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


module esfa_test;
    
    reg[0:0] clk = 0;
    reg[0:0] willWrite = 0;
    reg[7:0] new_index = 0;
    reg[7:0] new_value = 0;
    reg[7:0] metadata = 0;
    reg[0:0] isMetadata = 0;
    reg[7:0] rank = 0;
    reg[7:0] code = 0;
    wire resultBool;
    wire resultValue;
    reg[7:0] selector = 0;
    
    reg[0:0] r_true = 1;
    wire is_true;
    assign is_true = r_true;
    
    always begin
        clk = 1; #14;
        clk = 0; #14;
    end
    
 
    assert a0(.clk(clk), .test(is_true));
    
    ESFADesign l1(
        .clk(clk),
        .in_willWrite(willWrite),
        .new_index(new_index),
        .new_value(new_value),
        .metadata(metadata),
        .isMetadata(isMetadata),
        .resultBool(resultBool),
        .resultValue(resultValue),
        .selector(selector)  
    );
    
    
    initial
    begin
        // update Basic test
        $display("update basic test, begin");
        #420 //wait for reset to complete
        r_true = (l1.reset == 0); #168
        r_true = (l1.c0.new_rank == 0); #168
        $display("assertions working correctly");
        
        //ESFAArrayOp().update(emptyArrayState, None, 0, 5)
        new_index = 0;
        new_value = 5;
        isMetadata = 1'b0;
        selector = 7;
        #168;
        r_true = (resultBool == 1); #168;
        r_true = (resultValue == 0); #168;
        r_true = 1;
        willWrite = 1;
        metadata = resultValue;
        isMetadata = resultBool;
        selector = 0;
        #168;
        willWrite = 0;
        r_true = (l1.c0.new_arrDef == 1'b1); #168
        r_true = (l1.c0.new_eltDef == 1'b1); #168
        r_true = (l1.c0.new_mark == 1'b0); #168
        r_true = (l1.c0.new_index == 0); #168
        r_true = (l1.c0.new_value == 5); #168
        r_true = (l1.c0.new_rank == 1); #168
        r_true = (l1.c0.new_low == 0); #168
        r_true = (l1.c0.new_high == 0); #168
        r_true = (resultValue == 0); #168
        r_true = 1;
       
        //ESFAArrayOp().update(state_and_handle._1, Some(0), 2, 10)
        isMetadata = 1'b1;
        metadata = 0;
        selector = 3;
        #168;
        r_true = (resultBool); #168;
        r_true = 1;
        code = resultValue;
        r_true = (code == 0); #168;
        r_true = 1;
        selector = 8;
        #168;
        r_true = (resultBool); #168;
        r_true = (resultValue == 1); #168;
        r_true = 1;
        rank = resultValue;
        r_true = (rank == 1); #168;
        r_true = 1;
        selector = 7;
        #168;
        r_true = (resultBool); #168;
        r_true = (resultValue == 1); #168;
        r_true = 1;
        metadata = resultValue;
        isMetadata = 1'b1;
        new_index = 2;
        new_value = 10;
        selector = 0;
        willWrite = 1;
        #168;
        willWrite = 0;
        new_index = 1; //we know from previous markAvailable that handle 1 was open, and we wrote to it
        metadata = code;
        new_value = rank;
        selector = 5;
        willWrite = 1;
        #168;
        willWrite = 0;
        r_true = (resultBool); #168;
        r_true = 1;
      
        r_true = (l1.c0.new_arrDef == 1'b1); #168;
        r_true = (l1.c0.new_eltDef == 1'b1); #168;
        r_true = (l1.c0.new_mark == 1'b0); #168;
        r_true = (l1.c0.new_index == 0); #168;
        r_true = (l1.c0.new_value == 5); #168;
        r_true = (l1.c0.new_rank == 1); #168;
        r_true = (l1.c0.new_low == 0); #168;
        r_true = (l1.c0.new_high == 1); #168;
        
        r_true = (l1.c1.new_arrDef == 1'b1); #168;
        r_true = (l1.c1.new_eltDef == 1'b1); #168;
        r_true = (l1.c1.new_mark == 1'b0); #168;
        r_true = (l1.c1.new_index == 2); #168;
        r_true = (l1.c1.new_value == 10); #168;
        r_true = (l1.c1.new_rank == 2); #168;
        r_true = (l1.c1.new_low == 1); #168;
        r_true = (l1.c1.new_high == 1); #168;
       
        
        //ESFAArrayOp().update(state_and_handle._1, None, 4, 10)
        new_index = 4;
        new_value = 10;
        isMetadata = 1'b0;
        selector = 3;
        willWrite = 1;
        #168;
        selector = 7;
        #168;
        selector = 0;
        #168;
        selector = 5;
        #168;
        willWrite = 0;
        r_true = (l1.c0.new_arrDef == 1'b1);
        r_true = (l1.c0.new_eltDef == 1'b1);
        r_true = (l1.c0.new_mark == 1'b0);
        r_true = (l1.c0.new_index == 0);
        r_true = (l1.c0.new_value == 5);
        r_true = (l1.c0.new_rank == 1);
        r_true = (l1.c0.new_low == 0);
        r_true = (l1.c0.new_high == 1);
        r_true = (l1.c0.handle == 0);
        
        r_true = (l1.c1.new_arrDef == 1'b1);
        r_true = (l1.c1.new_eltDef == 1'b1);
        r_true = (l1.c1.new_mark == 1'b0);
        r_true = (l1.c1.new_index == 2);
        r_true = (l1.c1.new_value == 10);
        r_true = (l1.c1.new_rank == 2);
        r_true = (l1.c1.new_low == 1);
        r_true = (l1.c1.new_high == 1);
        r_true = (l1.c1.handle == 1);
        
        r_true = (l1.c2.new_arrDef == 1'b1);
        r_true = (l1.c2.new_eltDef == 1'b1);
        r_true = (l1.c2.new_mark == 1'b0);
        r_true = (l1.c2.new_index == 4);
        r_true = (l1.c2.new_value == 10);
        r_true = (l1.c2.new_rank == 1);
        r_true = (l1.c2.new_low == 2);
        r_true = (l1.c2.new_high == 2);
        r_true = (l1.c2.handle == 2);
        
        r_true = resultBool;
        r_true = (resultValue == 2);
        
        //state_and_handle = ESFAArrayOp().update(state_and_handle._1, Some(2), 10, 21)
        new_index = 10;
        new_value = 21;
        isMetadata = 1'b1;
        metadata = 2;
        selector = 3;
        willWrite = 1;
        #168;
        selector = 7;
        #168;
        selector = 0;
        #168;
        selector = 5;
        #168;
        willWrite = 0;
        r_true = (l1.c0.new_arrDef == 1'b1);
        r_true = (l1.c0.new_eltDef == 1'b1);
        r_true = (l1.c0.new_mark == 1'b0);
        r_true = (l1.c0.new_index == 0);
        r_true = (l1.c0.new_value == 5);
        r_true = (l1.c0.new_rank == 1);
        r_true = (l1.c0.new_low == 0);
        r_true = (l1.c0.new_high == 1);
        r_true = (l1.c0.handle == 0);
        
        r_true = (l1.c1.new_arrDef == 1'b1);
        r_true = (l1.c1.new_eltDef == 1'b1);
        r_true = (l1.c1.new_mark == 1'b0);
        r_true = (l1.c1.new_index == 2);
        r_true = (l1.c1.new_value == 10);
        r_true = (l1.c1.new_rank == 2);
        r_true = (l1.c1.new_low == 1);
        r_true = (l1.c1.new_high == 1);
        r_true = (l1.c1.handle == 1);
        
        r_true = (l1.c3.new_arrDef == 1'b1);
        r_true = (l1.c3.new_eltDef == 1'b1);
        r_true = (l1.c3.new_mark == 1'b0);
        r_true = (l1.c3.new_index == 10);
        r_true = (l1.c3.new_value == 21);
        r_true = (l1.c3.new_rank == 2);
        r_true = (l1.c3.new_low == 3);
        r_true = (l1.c3.new_high == 3);
        r_true = (l1.c3.handle == 3);
        
        r_true = (l1.c2.new_arrDef == 1'b1);
        r_true = (l1.c2.new_eltDef == 1'b1);
        r_true = (l1.c2.new_mark == 1'b0);
        r_true = (l1.c2.new_index == 4);
        r_true = (l1.c2.new_value == 10);
        r_true = (l1.c2.new_rank == 1);
        r_true = (l1.c2.new_low == 2);
        r_true = (l1.c2.new_high == 3);
        r_true = (l1.c2.handle == 2);
        
        r_true = resultBool;
        r_true = (resultValue == 3);
        
        //ESFAArrayOp().update(state_and_handle._1, Some(1), 9, 5)
        new_index = 9;
        new_value = 5;
        isMetadata = 1'b1;
        metadata = 1;
        selector = 3;
        willWrite = 1;
        #168;
        selector = 7;
        #168;
        selector = 0;
        #168;
        selector = 5;
        #168;
        willWrite = 0;
        r_true = (l1.c0.new_arrDef == 1'b1);
        r_true = (l1.c0.new_eltDef == 1'b1);
        r_true = (l1.c0.new_mark == 1'b0);
        r_true = (l1.c0.new_index == 0);
        r_true = (l1.c0.new_value == 5);
        r_true = (l1.c0.new_rank == 1);
        r_true = (l1.c0.new_low == 0);
        r_true = (l1.c0.new_high == 2);
        r_true = (l1.c0.handle == 0);
        r_true = (l1.c0.new_array_code == 0);
        
        r_true = (l1.c1.new_arrDef == 1'b1);
        r_true = (l1.c1.new_eltDef == 1'b1);
        r_true = (l1.c1.new_mark == 1'b0);
        r_true = (l1.c1.new_index == 2);
        r_true = (l1.c1.new_value == 10);
        r_true = (l1.c1.new_rank == 2);
        r_true = (l1.c1.new_low == 1);
        r_true = (l1.c1.new_high == 2);
        r_true = (l1.c1.handle == 1);
        r_true = (l1.c1.new_array_code == 1);
        
        r_true = (l1.c3.new_arrDef == 1'b1);
        r_true = (l1.c3.new_eltDef == 1'b1);
        r_true = (l1.c3.new_mark == 1'b0);
        r_true = (l1.c3.new_index == 10);
        r_true = (l1.c3.new_value == 21);
        r_true = (l1.c3.new_rank == 2);
        r_true = (l1.c3.new_low == 4);
        r_true = (l1.c3.new_high == 4);
        r_true = (l1.c3.handle == 3);
        r_true = (l1.c3.new_array_code == 4);
        
        r_true = (l1.c2.new_arrDef == 1'b1);
        r_true = (l1.c2.new_eltDef == 1'b1);
        r_true = (l1.c2.new_mark == 1'b0);
        r_true = (l1.c2.new_index == 4);
        r_true = (l1.c2.new_value == 10);
        r_true = (l1.c2.new_rank == 1);
        r_true = (l1.c2.new_low == 3);
        r_true = (l1.c2.new_high == 4);
        r_true = (l1.c2.handle == 2);
        r_true = (l1.c2.new_array_code == 3);
        
        r_true = (l1.c4.new_arrDef == 1'b1);
        r_true = (l1.c4.new_eltDef == 1'b1);
        r_true = (l1.c4.new_mark == 1'b0);
        r_true = (l1.c4.new_index == 9);
        r_true = (l1.c4.new_value == 5);
        r_true = (l1.c4.new_rank == 3);
        r_true = (l1.c4.new_low == 2);
        r_true = (l1.c4.new_high == 2);
        r_true = (l1.c4.handle == 4);
        r_true = (l1.c4.new_array_code == 2);
        
        r_true = resultBool;
        r_true = (resultValue == 4);
        
        //ESFAArrayOp().update(state_and_handle._1, Some(1), 11, 14)
        new_index = 11;
        new_value = 14;
        isMetadata = 1'b1;
        metadata = 1;
        selector = 3;
        willWrite = 1;
        #168;
        selector = 7;
        #168;
        selector = 0;
        #168;
        selector = 5;
        #168;
        willWrite = 0;
        r_true = (l1.c0.new_arrDef == 1'b1);
        r_true = (l1.c0.new_eltDef == 1'b1);
        r_true = (l1.c0.new_mark == 1'b0);
        r_true = (l1.c0.new_index == 0);
        r_true = (l1.c0.new_value == 5);
        r_true = (l1.c0.new_rank == 1);
        r_true = (l1.c0.new_low == 0);
        r_true = (l1.c0.new_high == 3);
        r_true = (l1.c0.handle == 0);
        r_true = (l1.c0.new_array_code == 0);
        
        r_true = (l1.c1.new_arrDef == 1'b1);
        r_true = (l1.c1.new_eltDef == 1'b1);
        r_true = (l1.c1.new_mark == 1'b0);
        r_true = (l1.c1.new_index == 2);
        r_true = (l1.c1.new_value == 10);
        r_true = (l1.c1.new_rank == 2);
        r_true = (l1.c1.new_low == 1);
        r_true = (l1.c1.new_high == 3);
        r_true = (l1.c1.handle == 1);
        r_true = (l1.c1.new_array_code == 1);
        
        r_true = (l1.c3.new_arrDef == 1'b1);
        r_true = (l1.c3.new_eltDef == 1'b1);
        r_true = (l1.c3.new_mark == 1'b0);
        r_true = (l1.c3.new_index == 10);
        r_true = (l1.c3.new_value == 21);
        r_true = (l1.c3.new_rank == 2);
        r_true = (l1.c3.new_low == 5);
        r_true = (l1.c3.new_high == 5);
        r_true = (l1.c3.handle == 3);
        r_true = (l1.c3.new_array_code == 5);
        
        r_true = (l1.c2.new_arrDef == 1'b1);
        r_true = (l1.c2.new_eltDef == 1'b1);
        r_true = (l1.c2.new_mark == 1'b0);
        r_true = (l1.c2.new_index == 4);
        r_true = (l1.c2.new_value == 10);
        r_true = (l1.c2.new_rank == 1);
        r_true = (l1.c2.new_low == 4);
        r_true = (l1.c2.new_high == 5);
        r_true = (l1.c2.handle == 2);
        r_true = (l1.c2.new_array_code == 4);
        
        r_true = (l1.c4.new_arrDef == 1'b1);
        r_true = (l1.c4.new_eltDef == 1'b1);
        r_true = (l1.c4.new_mark == 1'b0);
        r_true = (l1.c4.new_index == 9);
        r_true = (l1.c4.new_value == 5);
        r_true = (l1.c4.new_rank == 3);
        r_true = (l1.c4.new_low == 3);
        r_true = (l1.c4.new_high == 3);
        r_true = (l1.c4.handle == 4);
        r_true = (l1.c4.new_array_code == 3);
        
        r_true = (l1.c5.new_arrDef == 1'b1);
        r_true = (l1.c5.new_eltDef == 1'b1);
        r_true = (l1.c5.new_mark == 1'b0);
        r_true = (l1.c5.new_index == 11);
        r_true = (l1.c5.new_value == 14);
        r_true = (l1.c5.new_rank == 3);
        r_true = (l1.c5.new_low == 2);
        r_true = (l1.c5.new_high == 2);
        r_true = (l1.c5.handle == 5);
        r_true = (l1.c5.new_array_code == 2);
        
        r_true = resultBool;
        r_true = (resultValue == 5);
        
        // ESFAArrayOp().lookUp(state_and_handle._1, 0, 0)
        new_index = 0;
        isMetadata = 1'b1;
        metadata = 0;
        selector = 3;
        #168;
        selector = 1;
        #168;
        selector = 2;
        #168;
        
        r_true = resultBool;
        r_true = (resultValue == 5);
        
        //ESFAArrayOp().lookUp(state_and_handle._1, 1, 0)
        new_index = 0;
        isMetadata = 1'b1;
        metadata = 1;
        selector = 3;
        #168;
        selector = 1;
        #168;
        selector = 2;
        #168;
        
        r_true = resultBool;
        r_true = (resultValue == 5);
        
        //ESFAArrayOp().lookUp(state_and_handle._1, 1, 2) 
        new_index = 2;
        isMetadata = 1'b1;
        metadata = 1;
        selector = 3;
        #168;
        selector = 1;
        #168;
        selector = 2;
        #168;
        
        r_true = resultBool;
        r_true = (resultValue == 10);
        
        //ESFAArrayOp().lookUp(state_and_handle._1, 3, 4)
        new_index = 4;
        isMetadata = 1'b1;
        metadata = 3;
        selector = 3;
        #168;
        selector = 1;
        #168;
        selector = 2;
        #168;
        
        r_true = resultBool;
        r_true = (resultValue == 10);
        
        //ESFAArrayOp().lookUp(state_and_handle._1, 5, 2)
        new_index = 2;
        isMetadata = 1'b1;
        metadata = 5;
        selector = 3;
        #168;
        selector = 1;
        #168;
        selector = 2;
        #168;
        
        r_true = resultBool;
        r_true = (resultValue == 10);
        
        //ESFAArrayOp().lookUp(state_and_handle._1, 5, 1)
        new_index = 1;
        isMetadata = 1'b1;
        metadata = 5;
        selector = 3;
        #168;
        selector = 1;
        #168;
        selector = 2;
        #168;
        
        r_true = (resultBool == 0); //there is no value with index 1 in sixth array
        
        //ESFAArrayOp().delete(state_and_handle._1, 1)
        isMetadata = 1'b1;
        metadata = 1;
        selector = 4;
        willWrite = 1;
        #168;
        selector = 6;
        #168;
        willWrite = 0;
        r_true = (l1.c0.new_arrDef == 1'b1);
        r_true = (l1.c0.new_eltDef == 1'b1);
        r_true = (l1.c0.new_mark == 1'b0);
        r_true = (l1.c0.new_index == 0);
        r_true = (l1.c0.new_value == 5);
        r_true = (l1.c0.new_rank == 1);
        r_true = (l1.c0.new_low == 0);
        r_true = (l1.c0.new_high == 2);
        r_true = (l1.c0.handle == 0);
        r_true = (l1.c0.new_array_code == 0);
        
        r_true = (l1.c1.new_arrDef == 1'b0);
        r_true = (l1.c1.new_eltDef == 1'b1);
        r_true = (l1.c1.new_mark == 1'b0);
        r_true = (l1.c1.new_index == 2);
        r_true = (l1.c1.new_value == 10);
        r_true = (l1.c1.new_rank == 0);
        r_true = (l1.c1.new_low == 1);
        r_true = (l1.c1.new_high == 2);
        r_true = (l1.c1.handle == 1);
        r_true = (l1.c1.new_array_code == 1);
        
        r_true = (l1.c3.new_arrDef == 1'b1);
        r_true = (l1.c3.new_eltDef == 1'b1);
        r_true = (l1.c3.new_mark == 1'b0);
        r_true = (l1.c3.new_index == 10);
        r_true = (l1.c3.new_value == 21);
        r_true = (l1.c3.new_rank == 2);
        r_true = (l1.c3.new_low == 4);
        r_true = (l1.c3.new_high == 4);
        r_true = (l1.c3.handle == 3);
        r_true = (l1.c3.new_array_code == 4);
        
        r_true = (l1.c2.new_arrDef == 1'b1);
        r_true = (l1.c2.new_eltDef == 1'b1);
        r_true = (l1.c2.new_mark == 1'b0);
        r_true = (l1.c2.new_index == 4);
        r_true = (l1.c2.new_value == 10);
        r_true = (l1.c2.new_rank == 1);
        r_true = (l1.c2.new_low == 3);
        r_true = (l1.c2.new_high == 4);
        r_true = (l1.c2.handle == 2);
        r_true = (l1.c2.new_array_code == 3);
        
        r_true = (l1.c4.new_arrDef == 1'b1);
        r_true = (l1.c4.new_eltDef == 1'b1);
        r_true = (l1.c4.new_mark == 1'b0);
        r_true = (l1.c4.new_index == 9);
        r_true = (l1.c4.new_value == 5);
        r_true = (l1.c4.new_rank == 3);
        r_true = (l1.c4.new_low == 2);
        r_true = (l1.c4.new_high == 2);
        r_true = (l1.c4.handle == 4);
        r_true = (l1.c4.new_array_code == 2);
        
        r_true = (l1.c5.new_arrDef == 1'b1);
        r_true = (l1.c5.new_eltDef == 1'b1);
        r_true = (l1.c5.new_mark == 1'b0);
        r_true = (l1.c5.new_index == 11);
        r_true = (l1.c5.new_value == 14);
        r_true = (l1.c5.new_rank == 3);
        r_true = (l1.c5.new_low == 1);
        r_true = (l1.c5.new_high == 1);
        r_true = (l1.c5.handle == 5);
        r_true = (l1.c5.new_array_code == 1);
        
        //ESFAArrayOp().delete(post_deletion_state, 4)
        isMetadata = 1'b1;
        metadata = 4;
        selector = 4;
        willWrite = 1;
        #168;
        selector = 6;
        #168;
        willWrite = 0;
        
        //ESFAArrayOp().delete(post_deletion_state, 5)
        isMetadata = 1'b1;
        metadata = 5;
        selector = 4;
        willWrite = 1;
        #168;
        selector = 6;
        #168;
        willWrite = 0;
        
        r_true = (l1.c0.new_arrDef == 1'b1);
        r_true = (l1.c0.new_eltDef == 1'b1);
        r_true = (l1.c0.new_mark == 1'b0);
        r_true = (l1.c0.new_index == 0);
        r_true = (l1.c0.new_value == 5);
        r_true = (l1.c0.new_rank == 1);
        r_true = (l1.c0.new_low == 0);
        r_true = (l1.c0.new_high == 0);
        r_true = (l1.c0.handle == 0);
        r_true = (l1.c0.new_array_code == 0);
        
        r_true = (l1.c1.new_arrDef == 1'b0);
        r_true = (l1.c1.new_eltDef == 1'b0);
        r_true = (l1.c1.new_mark == 1'b0);
        
        r_true = (l1.c3.new_arrDef == 1'b1);
        r_true = (l1.c3.new_eltDef == 1'b1);
        r_true = (l1.c3.new_mark == 1'b0);
        r_true = (l1.c3.new_index == 10);
        r_true = (l1.c3.new_value == 21);
        r_true = (l1.c3.new_rank == 2);
        r_true = (l1.c3.new_low == 2);
        r_true = (l1.c3.new_high == 2);
        r_true = (l1.c3.handle == 3);
        r_true = (l1.c3.new_array_code == 2);
        
        r_true = (l1.c2.new_arrDef == 1'b1);
        r_true = (l1.c2.new_eltDef == 1'b1);
        r_true = (l1.c2.new_mark == 1'b0);
        r_true = (l1.c2.new_index == 4);
        r_true = (l1.c2.new_value == 10);
        r_true = (l1.c2.new_rank == 1);
        r_true = (l1.c2.new_low == 1);
        r_true = (l1.c2.new_high == 2);
        r_true = (l1.c2.handle == 2);
        r_true = (l1.c2.new_array_code == 1);
        
        r_true = (l1.c4.new_arrDef == 1'b0);
        r_true = (l1.c4.new_eltDef == 1'b0);
        r_true = (l1.c4.new_mark == 1'b0);
        
        r_true = (l1.c5.new_arrDef == 1'b0);
        r_true = (l1.c5.new_eltDef == 1'b0);
        r_true = (l1.c5.new_mark == 1'b0);

        //ESFAArrayOp().lookUp(post_deletion_state, 0, 0) 
        new_index = 0;
        isMetadata = 1'b1;
        metadata = 0;
        selector = 3;
        #168;
        selector = 1;
        #168;
        selector = 2;
        #168;
        
        r_true = resultBool;
        r_true = (resultValue == 5);
        
        
    end
   
    
endmodule
