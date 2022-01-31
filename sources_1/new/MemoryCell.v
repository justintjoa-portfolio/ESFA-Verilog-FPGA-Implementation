`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2021 12:48:37 PM
// Design Name: 
// Module Name: MemoryCell
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


module MemoryCell(
        input[0:0] clk,
        input[0:0] reset,
        input[7:0] handle,
        input[7:0] queried_handle,
        input[0:0] is_available_handle,
        input[7:0] available_handle,
        input[7:0] inserted_index,
        input[7:0] inserted_value,
        input[0:0] is_given_code,
        input[7:0] given_code,
        input[0:0] is_given_rank,
        input[7:0] given_rank,
        input[7:0] selector,
        output reg[0:0] new_bool = 1'b0,
        output reg[7:0] new_result_value = 0,
        output reg[7:0] new_context = 0
    );
    
     
     reg[0:0] r_willWrite;
     reg[0:0] r_willOutput;
     reg[0:0] didMutate = 1'b0;
     
     reg[0:0] new_arrDef = 1'b0;
     reg[0:0] new_arrDef_next = 1'b0;
     reg[7:0] new_array_code = 0; 
     reg[7:0] new_array_code_next = 0;
     reg[0:0] new_eltDef = 1'b0;
     reg[0:0] new_eltDef_next = 1'b0;
     reg[7:0] new_rank = 0;
     reg[7:0] new_rank_next = 0;
     reg[7:0] new_low = 0;
     reg[7:0] new_low_next = 0;
     reg[7:0] new_high = 0;
     reg[7:0] new_high_next = 0;
     reg[7:0] new_index = 0;
     reg[7:0] new_index_next = 0;
     reg[7:0] new_value = 0;
     reg[7:0] new_value_next = 0;
     reg[0:0] new_bool_next = 1'b0;
     reg[7:0] new_result_value_next = 0;
     reg[7:0] new_context_next = 0;
     
    //Map
    // 0 : update  
    // 1 : lookUpScan    
    // 2: encode     
    // 3: congrueUp 
    // 4: congrueDown
    // 5: markAvailableCell
    // 6: enrank
    // 7: debug
     
     
     
    always @ (posedge clk)
        begin
                if (reset == 1'b0) begin
                    new_arrDef <= 1'b0;
                    new_array_code <= 0;
                    new_eltDef <= 1'b0;
                    new_rank <= 0;
                    new_low <= 0;
                    new_high <= 0;
                    new_index <= 0;
                    new_value <= 0;
                    
                    new_result_value <= 8'b0;
                    new_bool <= 1'b0;  
                    new_context <= 8'b0;
                    didMutate <= 1'b0;
                end else begin  
                      if (r_willWrite) begin
                           if (!didMutate) begin  
                                didMutate <= 1'b1;
                                new_arrDef <= new_arrDef_next;
                                new_array_code <= new_array_code_next;
                                new_eltDef <= new_eltDef_next;
                                new_rank <= new_rank_next;
                                new_low <= new_low_next;
                                new_high <= new_high_next;
                                new_index <= new_index_next;
                                new_value <= new_value_next;
                           end
                      end else begin   
                          didMutate <= 1'b0;
                      end
                      if (r_willOutput) begin         
                            new_bool <= new_bool_next;
                            new_result_value <= new_result_value_next;
                            new_context <= new_context_next;
                      end
                    end
                
     
    end
    
    
    
    always @(*) begin
               r_willWrite = 1'b0;
               r_willOutput = 1'b1;
               new_arrDef_next = new_arrDef;
               new_array_code_next = new_array_code;
               new_eltDef_next = new_eltDef;
               new_low_next = new_low;
               new_high_next = new_high;
               new_value_next = new_value;
               new_index_next = new_index;
               new_rank_next = new_rank;
               new_bool_next = 1'b0;
               new_result_value_next = 0;
               new_context_next = 0;
               case (selector)
                    0: begin
                        new_bool_next = (available_handle == handle && is_available_handle);
               
                        if (new_bool_next) begin  
                            new_arrDef_next = 1'b1;
                            new_array_code_next = handle;
                            new_eltDef_next = 1'b1;
                            new_low_next = handle;
                            new_high_next = handle;
                            new_value_next = inserted_value;
                            new_index_next = inserted_index;
                            new_rank_next = 1;
                        end   
                        new_result_value_next = handle;
                        new_context_next = handle;
                        r_willWrite = 1'b1;
                    end
                    
                    1: begin
                        new_bool_next = (new_index_next == inserted_index) && is_given_code && (given_code >= new_low_next) && (given_code <= new_high_next);
                        new_result_value_next = new_value_next;
                        new_context_next = new_rank_next;
                    
                    end
               
                    2: begin
                        new_bool_next = (!(queried_handle > 7)) && (new_arrDef_next) && (queried_handle  == handle);
                        new_result_value_next = new_array_code_next;
                        new_context_next = new_array_code_next;
                    end
                    
                    3: begin
                        if (is_given_code && is_given_rank) begin 
                            new_bool_next = 1'b1;
                            if (available_handle == handle && is_available_handle) begin   
                                new_array_code_next = given_code + 1;
                                new_high_next = given_code + 1;
                                new_low_next = given_code + 1;
                                new_rank_next = given_rank + 1;
                            end else begin     
                                if (new_array_code_next > given_code && new_arrDef_next) begin 
                                    new_array_code_next = new_array_code_next + 1;
                                end
                                if (new_eltDef_next) begin 
                                    if (new_low_next > given_code) begin 
                                        new_low_next = new_low_next + 1;
                                    end
                                    if (new_high_next >= given_code) begin 
                                        new_high_next = new_high_next + 1;
                                    end
                                end
                            end
                        r_willWrite = 1'b1;
                        end
                    end
                    
                    4: begin
                        if (is_given_code) begin  
                            new_bool_next = 1'b1;
                            if (queried_handle == handle) begin    
                                new_arrDef_next = 1'b0;
                                new_rank_next = 0;
                            end
                       
                            if (new_eltDef_next && given_code < new_low_next) begin  
                                new_high_next = new_high_next - 1;
                                new_low_next = new_low_next - 1;
                            end else begin   
                                if (new_eltDef_next && (new_low_next <= given_code && given_code <= new_high_next)) begin 
                                    new_high_next = new_high_next - 1;
                                end
                            end
                            if (new_eltDef_next && new_low_next > new_high_next) begin 
                                new_eltDef_next = 1'b0;
                                new_arrDef_next = 1'b0;
                            end
                            if (new_arrDef_next && new_array_code_next > given_code) begin 
                                new_array_code_next = new_array_code_next - 1;
                            end

                            r_willWrite = 1'b1;
                        end
                    end
                
                    5: begin
                        new_bool_next = ! new_eltDef_next;
                        new_result_value_next = handle;
                        new_context_next = handle;
                    end

                    6: begin   
                        new_bool_next = (!(queried_handle > 7)) && (new_arrDef_next) && (queried_handle == handle);
                        new_result_value_next = new_rank_next;
                        new_context_next = new_rank_next;
                    end
                    
                    7: begin
                        if (queried_handle == handle) begin    
                            if (is_given_code && is_given_rank) begin 
                                new_bool_next = 1'b1;
                                if (available_handle == handle && is_available_handle) begin   
                                    new_array_code_next = given_code + 1;
                                    new_high_next = given_code + 1;
                                    new_low_next = given_code + 1;
                                    new_rank_next = given_rank + 1;
                                end else begin     
                                    if (new_array_code_next > given_code && new_arrDef_next) begin 
                                        new_array_code_next = new_array_code_next + 1;
                                    end
                                    if (new_eltDef_next) begin 
                                        if (new_low_next > given_code) begin 
                                            new_low_next = new_low_next + 1;
                                        end
                                        if (new_high_next >= given_code) begin 
                                            new_high_next = new_high_next + 1;
                                        end
                                    end
                                end
                            end
                        end
                    end
                   
                    8: begin   
                        new_bool_next = 1'b1;
                        r_willOutput = 1'b0;
                    end
                    
                    
                endcase
           end

            
            
  
endmodule




