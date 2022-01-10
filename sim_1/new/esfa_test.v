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
    reg[7:0] handle = 0;
    wire[0:0] resultBool;
    wire[7:0] resultValue;
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
        
        //ESFAArrayOp().update(emptyArrayState, None=, 0, 5)
        new_index = 0;
        new_value = 5;
        isMetadata = 1'b0;
        selector = 5;
        #168;
        r_true = (resultBool == 1); #168;
        r_true = (resultValue == 0); #168;
        r_true = 1;
        metadata = resultValue;
        isMetadata = resultBool;
        selector = 0;
        willWrite = 0;
        #28;
        willWrite = 1;
        #168;
        isMetadata = 0;
        new_index = 0; 
        selector = 3;
        // CRITICAL FOR FUNCTIONAL TESTING: WILL_WRITE SHOULD ONLY BE HIGH FOR ONE CYCLE  
        willWrite = 0;
        #28;
        willWrite = 1;
        #28; // allow a cycle for outputs to stabilize, then write 
        willWrite = 0;
        #392
        willWrite = 0;
        
        
        
        r_true = (l1.c0.new_arrDef == 1'b1); #168
        r_true = (l1.c0.new_eltDef == 1'b1); #168
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
        selector = 2;
        #168;
        r_true = (resultBool); #168;
        r_true = 1;
        code = resultValue;
        r_true = (code == 0); #168;
        r_true = 1;
        selector = 6;
        #168;
        r_true = (resultBool); #168;
        r_true = (resultValue == 1); #168;
        r_true = 1;
        rank = resultValue;
        r_true = (rank == 1); #168;
        r_true = 1;
        selector = 5;
        #168;
        r_true = (resultBool); #168;
        r_true = (resultValue == 1); #168;
        r_true = 1;
        metadata = resultValue;
        isMetadata = 1'b1;
        new_index = 2;
        new_value = 8'b1010;
        selector = 0;
        willWrite = 0; //allow a cycle for outputs to stabilize before writing  
        #28;
        willWrite = 1;
        #168;
        willWrite = 0;
        new_index = 1; //we know from previous markAvailable that handle 1 was open, and we wrote to it
        metadata = code;
        new_value = rank;
        selector = 3;
        willWrite = 0;
        #28; // allow a cycle for outputs to stabilize, then write 
        willWrite = 1;
        #28; 
        willWrite = 0;
        #392;
        willWrite = 0;
        r_true = (resultBool); #168;
        r_true = 1;
      
        r_true = (l1.c0.new_arrDef == 1'b1); #168;
        r_true = (l1.c0.new_eltDef == 1'b1); #168;
        r_true = (l1.c0.new_index == 0); #168;
        r_true = (l1.c0.new_value == 5); #168;
        r_true = (l1.c0.new_rank == 1); #168;
        r_true = (l1.c0.new_low == 0); #168;
        r_true = (l1.c0.new_high == 1); #168;
        
        r_true = (l1.c1.new_arrDef == 1'b1); #168;
        r_true = (l1.c1.new_eltDef == 1'b1); #168;
        r_true = (l1.c1.new_index == 2); #168;
        r_true = (l1.c1.new_value == 8'b1010); #168;
        r_true = (l1.c1.new_rank == 2); #168;
        r_true = (l1.c1.new_low == 1); #168;
        r_true = (l1.c1.new_high == 1); #168;
        r_true = 1; 
        
        //enrange(0)
        willWrite = 0;
        isMetadata = 1'b1;
        metadata = 0;
        selector = 7;
        #28;
        r_true = (resultBool); #28;
        r_true = (resultValue == 1); #28;
        r_true = 1;
        isMetadata = 1'b0;
        #28;
        r_true = (resultBool); #28;
        r_true = (resultValue == 0); #28;
        r_true = 1;
        
        //ESFAArrayOp().update(state_and_handle._1, None, 4, 10)
        selector = 5;
        #168;
        r_true = (resultBool == 1); #168
        r_true = (resultValue == 2); #168
        r_true = 1;
        
        selector = 0;
        new_index = 4;
        new_value = 8'b1010;
        isMetadata = 1'b1;
        metadata = 2;
        willWrite = 0;
        #28;
        willWrite = 1;
        #168;
        isMetadata = 0;
        new_index = 2; 
        selector = 3;
        willWrite = 0;
        #28; // allow a cycle for outputs to stabilize, then write 
        willWrite = 1;
        #28; 
        willWrite = 0;
        #392;
        
        r_true = (l1.c0.new_arrDef == 1'b1); #168;
        r_true = (l1.c0.new_eltDef == 1'b1); #168;
        r_true = (l1.c0.new_index == 0); #168;
        r_true = (l1.c0.new_value == 5); #168;
        r_true = (l1.c0.new_rank == 1); #168;
        r_true = (l1.c0.new_low == 0); #168;
        r_true = (l1.c0.new_high == 1); #168;
        r_true = (l1.c0.handle == 0); #168;
        
        r_true = (l1.c1.new_arrDef == 1'b1); #168;
        r_true = (l1.c1.new_eltDef == 1'b1); #168;
        r_true = (l1.c1.new_index == 2); #168;
        r_true = (l1.c1.new_value == 8'b1010); #168;
        r_true = (l1.c1.new_rank == 2); #168;
        r_true = (l1.c1.new_low == 1); #168;
        r_true = (l1.c1.new_high == 1); #168;
        r_true = (l1.c1.handle == 1); #168;
        
        r_true = (l1.c2.new_arrDef == 1'b1); #168;
        r_true = (l1.c2.new_eltDef == 1'b1); #168;
        r_true = (l1.c2.new_index == 4); #168;
        r_true = (l1.c2.new_value == 8'b1010); #168;
        r_true = (l1.c2.new_rank == 1); #168;
        r_true = (l1.c2.new_low == 2); #168;
        r_true = (l1.c2.new_high == 2); #168;
        r_true = (l1.c2.handle == 2); #168;
        r_true = 1;
 
        
        //state_and_handle = ESFAArrayOp().update(state_and_handle._1, Some(2), 10, 21)
        isMetadata = 1;
        metadata = 2;
        selector = 2;
        #168;
        code = resultValue;
        r_true = (code == 2); #168;
        r_true = 1;
        selector = 6;
        #168;
        rank = resultValue;
        r_true = (rank == 1); #168;
        r_true = 1;
        selector = 5;
        #168;
        r_true = (resultValue == 3); #168;
        r_true = 1;
        isMetadata = 1;
        metadata = 3;
        new_index = 8'b1010;
        new_value = 8'b10101;
        selector = 0;
        willWrite = 0;
        #28;
        willWrite = 1;
        #168
        willWrite = 0;
        new_index = 3;
        isMetadata = 1;
        metadata = code;
        new_value = rank;
        selector = 3;
        willWrite = 0;
        #28; // allow a cycle for outputs to stabilize, then write 
        willWrite = 1;
        #28; 
        willWrite = 0;
        #392;

        r_true = (l1.c0.new_arrDef == 1'b1); #168;
        r_true = (l1.c0.new_eltDef == 1'b1); #168;
        r_true = (l1.c0.new_index == 0); #168;
        r_true = (l1.c0.new_value == 5); #168;
        r_true = (l1.c0.new_rank == 1); #168;
        r_true = (l1.c0.new_low == 0); #168;
        r_true = (l1.c0.new_high == 1); #168;
        r_true = (l1.c0.handle == 0); #168;
        
        r_true = (l1.c1.new_arrDef == 1'b1); #168;
        r_true = (l1.c1.new_eltDef == 1'b1); #168;
        r_true = (l1.c1.new_index == 2); #168;
        r_true = (l1.c1.new_value == 8'b1010); #168;
        r_true = (l1.c1.new_rank == 2); #168;
        r_true = (l1.c1.new_low == 1); #168;
        r_true = (l1.c1.new_high == 1); #168;
        r_true = (l1.c1.handle == 1); #168;
        
        r_true = (l1.c3.new_arrDef == 1'b1); #168;
        r_true = (l1.c3.new_eltDef == 1'b1); #168;
        r_true = (l1.c3.new_index == 8'b1010); #168;
        r_true = (l1.c3.new_value == 8'b10101); #168;
        r_true = (l1.c3.new_rank == 2); #168;
        r_true = (l1.c3.new_low == 3); #168;
        r_true = (l1.c3.new_high == 3); #168;
        r_true = (l1.c3.handle == 3); #168;
        
        r_true = (l1.c2.new_arrDef == 1'b1); #168;
        r_true = (l1.c2.new_eltDef == 1'b1); #168;
        r_true = (l1.c2.new_index == 4); #168;
        r_true = (l1.c2.new_value == 8'b1010); #168;
        r_true = (l1.c2.new_rank == 1); #168;
        r_true = (l1.c2.new_low == 2); #168;
        r_true = (l1.c2.new_high == 3); #168;
        r_true = (l1.c2.handle == 2); #168;
        
        r_true = resultBool; #168;
        r_true = 1;
        
        //ESFAArrayOp().update(state_and_handle._1, Some(1), 9, 5)
        isMetadata = 1;
        metadata = 1;
        selector = 2;
        #168;
        code = resultValue;
        selector = 6;
        #168;
        rank = resultValue;
        selector = 5;
        #168;
        isMetadata = 1;
        handle = resultValue;
        metadata = resultValue;
        new_index = 8'b1001;
        new_value = 8'b101;
        selector = 0;
        willWrite = 0;
        #28;
        willWrite = 1;
        #168
        willWrite = 0;
        new_index = handle;
        isMetadata = 1;
        metadata = code;
        new_value = rank;
        selector = 3;
        willWrite = 0;
        #28; // allow a cycle for outputs to stabilize, then write 
        willWrite = 1;
        #28; 
        willWrite = 0;
        willWrite = 0;
        #392;
        r_true = (l1.c0.new_arrDef == 1'b1); #168;
        r_true = (l1.c0.new_eltDef == 1'b1); #168;
        r_true = (l1.c0.new_index == 0); #168;
        r_true = (l1.c0.new_value == 5); #168;
        r_true = (l1.c0.new_rank == 1); #168;
        r_true = (l1.c0.new_low == 0); #168;
        r_true = (l1.c0.new_high == 2); #168;
        r_true = (l1.c0.handle == 0); #168;
        r_true = (l1.c0.new_array_code == 0); #168;
        
        r_true = (l1.c1.new_arrDef == 1'b1); #168;
        r_true = (l1.c1.new_eltDef == 1'b1); #168;
        r_true = (l1.c1.new_index == 2); #168;
        r_true = (l1.c1.new_value == 10); #168;
        r_true = (l1.c1.new_rank == 2); #168;
        r_true = (l1.c1.new_low == 1); #168;
        r_true = (l1.c1.new_high == 2); #168;
        r_true = (l1.c1.handle == 1); #168;
        r_true = (l1.c1.new_array_code == 1); #168;
        
        r_true = (l1.c3.new_arrDef == 1'b1); #168;
        r_true = (l1.c3.new_eltDef == 1'b1); #168;
        r_true = (l1.c3.new_index == 10); #168;
        r_true = (l1.c3.new_value == 21); #168;
        r_true = (l1.c3.new_rank == 2); #168;
        r_true = (l1.c3.new_low == 4); #168;
        r_true = (l1.c3.new_high == 4); #168;
        r_true = (l1.c3.handle == 3); #168;
        r_true = (l1.c3.new_array_code == 4); #168;
        
        r_true = (l1.c2.new_arrDef == 1'b1); #168;
        r_true = (l1.c2.new_eltDef == 1'b1); #168;
        r_true = (l1.c2.new_index == 4); #168;
        r_true = (l1.c2.new_value == 10); #168;
        r_true = (l1.c2.new_rank == 1); #168;
        r_true = (l1.c2.new_low == 3); #168;
        r_true = (l1.c2.new_high == 4); #168;
        r_true = (l1.c2.handle == 2); #168;
        r_true = (l1.c2.new_array_code == 3); #168;
        
        r_true = (l1.c4.new_arrDef == 1'b1); #168;
        r_true = (l1.c4.new_eltDef == 1'b1); #168;
        r_true = (l1.c4.new_index == 9); #168;
        r_true = (l1.c4.new_value == 5); #168;
        r_true = (l1.c4.new_rank == 3); #168;
        r_true = (l1.c4.new_low == 2); #168;
        r_true = (l1.c4.new_high == 2); #168;
        r_true = (l1.c4.handle == 4); #168;
        r_true = (l1.c4.new_array_code == 2); #168;
        
        r_true = resultBool; #168;
        r_true = 1;
        
        //ESFAArrayOp().update(state_and_handle._1, Some(1), 11, 14)
        isMetadata = 1;
        metadata = 1;
        selector = 2;
        #168;
        code = resultValue;
        selector = 6;
        #168;
        rank = resultValue;
        selector = 5;
        #168;
        isMetadata = 1;
        handle = resultValue;
        metadata = resultValue;
        new_index = 8'b1011;
        new_value = 8'b1110;
        selector = 0;
        willWrite = 0;
        #28;
        willWrite = 1;
        #168
        willWrite = 0;
        new_index = handle;
        isMetadata = 1;
        metadata = code;
        new_value = rank;
        selector = 3;
        willWrite = 0;
        #28; // allow a cycle for outputs to stabilize, then write 
        willWrite = 1;
        #28; 
        willWrite = 0;
        #392;
        
        r_true = (l1.c0.new_arrDef == 1'b1); #168;
        r_true = (l1.c0.new_eltDef == 1'b1); #168;
        r_true = (l1.c0.new_index == 0); #168;
        r_true = (l1.c0.new_value == 5); #168;
        r_true = (l1.c0.new_rank == 1); #168;
        r_true = (l1.c0.new_low == 0); #168;
        r_true = (l1.c0.new_high == 3); #168;
        r_true = (l1.c0.handle == 0); #168;
        r_true = (l1.c0.new_array_code == 0); #168;
        
        r_true = (l1.c1.new_arrDef == 1'b1); #168;
        r_true = (l1.c1.new_eltDef == 1'b1); #168;
        r_true = (l1.c1.new_index == 2); #168;
        r_true = (l1.c1.new_value == 10); #168;
        r_true = (l1.c1.new_rank == 2); #168;
        r_true = (l1.c1.new_low == 1); #168;
        r_true = (l1.c1.new_high == 3); #168;
        r_true = (l1.c1.handle == 1); #168;
        r_true = (l1.c1.new_array_code == 1); #168;
        
        r_true = (l1.c3.new_arrDef == 1'b1); #168;
        r_true = (l1.c3.new_eltDef == 1'b1); #168;
        r_true = (l1.c3.new_index == 10); #168;
        r_true = (l1.c3.new_value == 21); #168;
        r_true = (l1.c3.new_rank == 2); #168;
        r_true = (l1.c3.new_low == 5); #168;
        r_true = (l1.c3.new_high == 5); #168;
        r_true = (l1.c3.handle == 3); #168;
        r_true = (l1.c3.new_array_code == 5); #168;
        
        r_true = (l1.c2.new_arrDef == 1'b1); #168;
        r_true = (l1.c2.new_eltDef == 1'b1); #168;
        r_true = (l1.c2.new_index == 4); #168;
        r_true = (l1.c2.new_value == 10); #168;
        r_true = (l1.c2.new_rank == 1); #168;
        r_true = (l1.c2.new_low == 4); #168;
        r_true = (l1.c2.new_high == 5); #168;
        r_true = (l1.c2.handle == 2); #168;
        r_true = (l1.c2.new_array_code == 4); #168;
        
        r_true = (l1.c4.new_arrDef == 1'b1); #168;
        r_true = (l1.c4.new_eltDef == 1'b1); #168;
        r_true = (l1.c4.new_index == 9); #168;
        r_true = (l1.c4.new_value == 5); #168;
        r_true = (l1.c4.new_rank == 3); #168;
        r_true = (l1.c4.new_low == 3); #168;
        r_true = (l1.c4.new_high == 3); #168;
        r_true = (l1.c4.handle == 4); #168;
        r_true = (l1.c4.new_array_code == 3); #168;
        
        r_true = (l1.c5.new_arrDef == 1'b1); #168;
        r_true = (l1.c5.new_eltDef == 1'b1); #168;
        r_true = (l1.c5.new_index == 11); #168;
        r_true = (l1.c5.new_value == 14); #168;
        r_true = (l1.c5.new_rank == 3); #168;
        r_true = (l1.c5.new_low == 2); #168;
        r_true = (l1.c5.new_high == 2); #168;
        r_true = (l1.c5.handle == 5); #168;
        r_true = (l1.c5.new_array_code == 2); #168;
        
        r_true = resultBool;
        
        // ESFAArrayOp().lookUp(state_and_handle._1, 0, 0)
        isMetadata = 1;
        metadata = 0;
        selector = 2;
        #168;
        code = resultValue;
        metadata = code;
        isMetadata = 1;
        new_index = 0;
        selector = 1;
        #168
        
        r_true = resultBool; #168;
        r_true = (resultValue == 5); #168;
        r_true = 1;
        
        //ESFAArrayOp().lookUp(state_and_handle._1, 1, 0)
        isMetadata = 1;
        metadata = 1;
        selector = 2;
        #168;
        code = resultValue;
        metadata = code;
        isMetadata = 1;
        new_index = 0;
        selector = 1;
        #168
        
        r_true = resultBool; #168
        r_true = (resultValue == 5); #168
        r_true = 1;
        
        //ESFAArrayOp().lookUp(state_and_handle._1, 1, 2) 
        isMetadata = 1;
        metadata = 1;
        selector = 2;
        #168;
        code = resultValue;
        metadata = code;
        isMetadata = 1;
        new_index = 2;
        selector = 1;
        #168
        
        r_true = resultBool; #168;
        r_true = (resultValue == 10); #168;
        r_true = 1;
        
        //ESFAArrayOp().lookUp(state_and_handle._1, 3, 4)
        isMetadata = 1;
        metadata = 3;
        selector = 2;
        #168;
        code = resultValue;
        metadata = code;
        isMetadata = 1;
        new_index = 4;
        selector = 1;
        #168
        
        r_true = resultBool; #168;
        r_true = (resultValue == 10); #168;
        r_true = 1;
        
        //ESFAArrayOp().lookUp(state_and_handle._1, 5, 2)
        isMetadata = 1;
        metadata = 5;
        selector = 2;
        #168;
        code = resultValue;
        metadata = code;
        isMetadata = 1;
        new_index = 2;
        selector = 1;
        #168
        
        r_true = resultBool; #168;
        r_true = (resultValue == 10); #168;
        r_true = 1;
        
        //ESFAArrayOp().lookUp(state_and_handle._1, 5, 1)
        isMetadata = 1;
        metadata = 5;
        selector = 2;
        #168;
        code = resultValue;
        metadata = code;
        isMetadata = 1;
        new_index = 1;
        selector = 1;
        #168

        r_true = (resultBool == 0); #168; //there is no value with index 1 in sixth array 
        
        //ESFAArrayOp().delete(state_and_handle._1, 1)
        isMetadata = 1;
        metadata = 1;
        selector = 2;
        #168;
        
        code = resultValue;
        selector = 4;
        new_index = 1;
        metadata = code;
        
        willWrite = 0;
        #28;
        willWrite = 1;
        #28; // allow a cycle for outputs to stabilize, then write 
        willWrite = 0;
        #392;
        r_true = resultBool; #168;
        r_true = 1;
        
        
        r_true = (l1.c0.new_arrDef == 1'b1); #168;
        r_true = (l1.c0.new_eltDef == 1'b1); #168;
        r_true = (l1.c0.new_index == 0); #168;
        r_true = (l1.c0.new_value == 5); #168;
        r_true = (l1.c0.new_rank == 1); #168;
        r_true = (l1.c0.new_low == 0); #168;
        r_true = (l1.c0.new_high == 2); #168;
        r_true = (l1.c0.handle == 0); #168;
        r_true = (l1.c0.new_array_code == 0); #168;
        
        r_true = (l1.c1.new_arrDef == 1'b0); #168;
        r_true = (l1.c1.new_eltDef == 1'b1); #168;
        r_true = (l1.c1.new_index == 2); #168;
        r_true = (l1.c1.new_value == 10); #168;
        r_true = (l1.c1.new_rank == 0); #168;
        r_true = (l1.c1.new_low == 1); #168;
        r_true = (l1.c1.new_high == 2); #168;
        r_true = (l1.c1.handle == 1); #168;
        r_true = (l1.c1.new_array_code == 1); #168;
        
        r_true = (l1.c3.new_arrDef == 1'b1); #168;
        r_true = (l1.c3.new_eltDef == 1'b1); #168;
        r_true = (l1.c3.new_index == 10); #168;
        r_true = (l1.c3.new_value == 21); #168;
        r_true = (l1.c3.new_rank == 2); #168;
        r_true = (l1.c3.new_low == 4); #168;
        r_true = (l1.c3.new_high == 4); #168;
        r_true = (l1.c3.handle == 3); #168;
        r_true = (l1.c3.new_array_code == 4); #168;
        
        r_true = (l1.c2.new_arrDef == 1'b1); #168;
        r_true = (l1.c2.new_eltDef == 1'b1); #168;
        r_true = (l1.c2.new_index == 4); #168;
        r_true = (l1.c2.new_value == 10); #168;
        r_true = (l1.c2.new_rank == 1); #168;
        r_true = (l1.c2.new_low == 3); #168;
        r_true = (l1.c2.new_high == 4); #168;
        r_true = (l1.c2.handle == 2); #168;
        r_true = (l1.c2.new_array_code == 3); #168;
        
        r_true = (l1.c4.new_arrDef == 1'b1); #168;
        r_true = (l1.c4.new_eltDef == 1'b1); #168;
        r_true = (l1.c4.new_index == 9); #168;
        r_true = (l1.c4.new_value == 5); #168;
        r_true = (l1.c4.new_rank == 3); #168;
        r_true = (l1.c4.new_low == 2); #168;
        r_true = (l1.c4.new_high == 2); #168;
        r_true = (l1.c4.handle == 4); #168;
        r_true = (l1.c4.new_array_code == 2); #168;
        
        r_true = (l1.c5.new_arrDef == 1'b1); #168;
        r_true = (l1.c5.new_eltDef == 1'b1); #168;
        r_true = (l1.c5.new_index == 11); #168;
        r_true = (l1.c5.new_value == 14); #168;
        r_true = (l1.c5.new_rank == 3); #168;
        r_true = (l1.c5.new_low == 1); #168;
        r_true = (l1.c5.new_high == 1); #168;
        r_true = (l1.c5.handle == 5); #168;
        r_true = (l1.c5.new_array_code == 1); #168;
        r_true = 1;
        
        //ESFAArrayOp().delete(post_deletion_state, 4)
        isMetadata = 1;
        metadata = 4;
        selector = 2;
        #168;
        
        code = resultValue;
        selector = 4;
        new_index = 4;
        metadata = code;
        
        willWrite = 0;
        #28;
        willWrite = 1;
        #28; // allow a cycle for outputs to stabilize, then write 
        willWrite = 0;
        #392
        r_true = resultBool; #168;
        r_true = 1;
        
        //ESFAArrayOp().delete(post_deletion_state, 5)
        isMetadata = 1;
        metadata = 5;
        selector = 2;
        #168;
        
        code = resultValue;
        selector = 4;
        new_index = 5;
        metadata = code;
        
        willWrite = 0;
        #28;
        willWrite = 1;
        #28; // allow a cycle for outputs to stabilize, then write 
        willWrite = 0;
        #392;
        r_true = resultBool; #168;
        r_true = 1;
        
        r_true = (l1.c0.new_arrDef == 1'b1); #168
        r_true = (l1.c0.new_eltDef == 1'b1); #168
        r_true = (l1.c0.new_index == 0); #168
        r_true = (l1.c0.new_value == 5); #168
        r_true = (l1.c0.new_rank == 1); #168
        r_true = (l1.c0.new_low == 0); #168
        r_true = (l1.c0.new_high == 0); #168
        r_true = (l1.c0.handle == 0); #168
        r_true = (l1.c0.new_array_code == 0); #168
        
        r_true = (l1.c1.new_arrDef == 1'b0); #168
        r_true = (l1.c1.new_eltDef == 1'b0); #168
        
        r_true = (l1.c3.new_arrDef == 1'b1); #168
        r_true = (l1.c3.new_eltDef == 1'b1); #168
        r_true = (l1.c3.new_index == 10); #168
        r_true = (l1.c3.new_value == 21); #168
        r_true = (l1.c3.new_rank == 2); #168
        r_true = (l1.c3.new_low == 2); #168
        r_true = (l1.c3.new_high == 2); #168
        r_true = (l1.c3.handle == 3); #168
        r_true = (l1.c3.new_array_code == 2); #168
        
        r_true = (l1.c2.new_arrDef == 1'b1); #168
        r_true = (l1.c2.new_eltDef == 1'b1); #168
        r_true = (l1.c2.new_index == 4); #168
        r_true = (l1.c2.new_value == 10); #168
        r_true = (l1.c2.new_rank == 1); #168
        r_true = (l1.c2.new_low == 1); #168
        r_true = (l1.c2.new_high == 2); #168
        r_true = (l1.c2.handle == 2); #168
        r_true = (l1.c2.new_array_code == 1); #168
        
        r_true = (l1.c4.new_arrDef == 1'b0); #168
        r_true = (l1.c4.new_eltDef == 1'b0); #168
        
        r_true = (l1.c5.new_arrDef == 1'b0); #168
        r_true = (l1.c5.new_eltDef == 1'b0); #168

        //ESFAArrayOp().lookUp(post_deletion_state, 0, 0) 
        isMetadata = 1;
        metadata = 0;
        selector = 2;
        #168;
        code = resultValue;
        r_true = resultBool; #168;
        r_true = 1;
        metadata = code;
        isMetadata = 1;
        new_index = 0;
        selector = 1;
        #168
        
        r_true = resultBool; #168;
        r_true = (resultValue == 5); #168;
        
        
    end
   
    
endmodule
