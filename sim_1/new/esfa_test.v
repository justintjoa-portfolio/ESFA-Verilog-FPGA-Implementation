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
    reg[7:0] selector = 8;
    
    reg[0:0] r_true = 1;
    wire is_true;
    assign is_true = r_true;
    
    always begin
        clk = 1; #14;
        clk = 0; #14;
    end
    
    reg[0:0] reset = 1'b0;
 
    assert a0(.clk(clk), .test(is_true));
    
    ESFADesign l1(
        .clk(clk),
        .reset(reset),
        .new_index(new_index),
        .new_value(new_value),
        .metadata(metadata),
        .isMetadata(isMetadata),
        .resultBool(resultBool),
        .resultValue(resultValue),
        .selector(selector)  
    );
    
    task write;
    input[0:0] in_targetedHandle;
    input[7:0] in_handle;
    input[7:0] in_index;
    input[7:0] in_value; 
    begin  
        if (in_targetedHandle) begin   
            isMetadata = 1'b1;
            metadata = in_handle;
            selector = 2;
            #168;
            code = resultValue;
            selector = 6;
            #168;
            rank = resultValue;
        end
        selector = 5;
        #168;
        metadata = resultValue;
        isMetadata = 1'b1;
        new_index = in_index;
        new_value = in_value;
        selector = 0;
        #28;
        #28;
        selector = 8;
        #168;
        if (in_targetedHandle) begin  
            new_index = metadata;
            metadata = code;
            new_value = rank;
            selector = 3;
            #28;
            #28;
            selector = 8;
            #28;
            #28;
            end
    end
    endtask
    
    task delete;
    input[7:0] in_handle;
    begin  
        isMetadata = 1;
        metadata = in_handle;
        selector = 2;
        #168;
        
        code = resultValue;
        selector = 4;
        new_index = in_handle;
        metadata = code;
        
        #56; // allow a cycle for outputs to stabilize, then write 
        selector = 8;
        #56;
    end
    endtask
    
    task lookUp;
    input[7:0] in_handle;
    input[7:0] in_index;
    begin  
        isMetadata = 1;
        metadata = in_handle;
        selector = 2;
        #168;
        code = resultValue;
        metadata = code;
        isMetadata = 1;
        new_index = in_index;
        selector = 1;
        #168;
    end
    endtask
    
    
    initial
    begin
        // update Basic test
        $display("update basic test, begin");
        #420; //wait for reset to complete
        r_true = (l1.resultValue == 0); #168;
        r_true = (l1.resultBool == 1'b0); #168;
        r_true = (l1.c0.new_rank == 0); #168
        reset = 1'b1;
        $display("assertions working correctly");
        
        //ESFAArrayOp().update(emptyArrayState, None=, 0, 5)
        write(1'b0, 0, 0, 5);
        
        r_true = (l1.c0.new_arrDef == 1'b1); #168
        r_true = (l1.c0.new_eltDef == 1'b1); #168
        r_true = (l1.c0.new_index == 0); #168
        r_true = (l1.c0.new_value == 5); #168
        r_true = (l1.c0.new_rank == 1); #168
        r_true = (l1.c0.new_low == 0); #168
        r_true = (l1.c0.new_high == 0); #168
        r_true = (resultBool == 1'b1); #168;
        r_true = 1;
       
        //ESFAArrayOp().update(state_and_handle._1, Some(0), 2, 10)
        write(1'b1, 0, 2, 8'b1010);
      
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
        r_true = (resultBool == 1'b1); #168;
        r_true = 1; 
        
        //ESFAArrayOp().update(state_and_handle._1, None, 4, 10)
        write(1'b0, 0, 4, 8'b1010);
        
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
        r_true = (resultBool == 1'b1); #168;
        r_true = 1;
 
        
        //state_and_handle = ESFAArrayOp().update(state_and_handle._1, Some(2), 10, 21)
        write(1'b1, 2, 8'b1010, 8'b10101);

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
        write(1'b1, 1, 8'b1001, 8'b101);
 
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
        write(1'b1, 1, 8'b1011, 8'b1110);
        
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
       
        
        // ESFAArrayOp().lookUp(state_and_handle._1, 0, 0)
        lookUp(0, 0);
        
        r_true = resultBool; #168;
        r_true = (resultValue == 5); #168;
        r_true = 1;
        
        //ESFAArrayOp().lookUp(state_and_handle._1, 1, 0)
        lookUp(1,0);
        
        r_true = resultBool; #168
        r_true = (resultValue == 5); #168
        r_true = 1;
        
        //ESFAArrayOp().lookUp(state_and_handle._1, 1, 2) 
        lookUp(1, 2);
        
        r_true = resultBool; #168;
        r_true = (resultValue == 10); #168;
        r_true = 1;
        
        //ESFAArrayOp().lookUp(state_and_handle._1, 3, 4)
        lookUp(3,4);
        
        r_true = resultBool; #168;
        r_true = (resultValue == 10); #168;
        r_true = 1;
        
        //ESFAArrayOp().lookUp(state_and_handle._1, 5, 2)
        lookUp(5, 2);
        
        r_true = resultBool; #168;
        r_true = (resultValue == 10); #168;
        r_true = 1;
        
        //ESFAArrayOp().lookUp(state_and_handle._1, 5, 1)
        lookUp(5, 1);

        r_true = (resultBool == 0); #168; //there is no value with index 1 in sixth array 
        
        //ESFAArrayOp().delete(state_and_handle._1, 1)
        delete(1);
        
        
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
        delete(4);
        r_true = resultBool; #168;
        r_true = 1;
        
        //ESFAArrayOp().delete(post_deletion_state, 5)
        delete(5);
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
        lookUp(0,0);
        
        r_true = resultBool; #168;
        r_true = (resultValue == 5); #168;
        r_true = 1;
        
        
        // Updated key test
        $display("Updated key test");
        reset = 1'b0;
        selector = 8;
        #420; //wait for reset to complete
        r_true = (l1.resultValue == 0); #168;
        r_true = (l1.resultBool == 1'b0); #168;
        r_true = (l1.c0.new_rank == 0); #168
        reset = 1'b1;    
        $display("assertions working correctly");
        
        write(1'b0, 0, 0, 5);
        write(1'b1, 0, 0, 8'b1010);
        lookUp(0, 0); 
        
        r_true = resultBool; #168;
        r_true = (resultValue == 5); #168;
        r_true = 1;
        
        lookUp(1,0);
        r_true = resultBool; #168;
        r_true = (resultValue == 8'b1010); #168;
        r_true = 1;
        
        // Duplicate key and value test
        $display("Duplicate key and value test");
        reset = 1'b0;
        #420; //wait for reset to complete
        r_true = (l1.resultValue == 0); #168;
        r_true = (l1.resultBool == 1'b0); #168;
        r_true = (l1.c0.new_rank == 0); #168
        reset = 1'b1;    
        $display("assertions working correctly");
        
        write(1'b0, 0, 0, 5);
        write(1'b1, 0, 0, 5);
        lookUp(0, 0); 
        
        r_true = resultBool; #168;
        r_true = (resultValue == 5); #168;
        r_true = 1;
        
        lookUp(1, 0); 
        
        r_true = resultBool; #168;
        r_true = (resultValue == 5); #168;
        r_true = 1;
        
        lookUp(1, 10); #168;
        r_true = (resultBool == 1'b0); #168;
        r_true = 1;
        
    end
   
    
endmodule
