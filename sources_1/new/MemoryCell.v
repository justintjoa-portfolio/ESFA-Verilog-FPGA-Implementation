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
        input[7:0] handle, 
        input[7:0] inserted_index,
        input[7:0] inserted_value,
        input[7:0] metadata,
        input[0:0] isMetadata,
        input[7:0] selector,
        output reg[0:0] new_bool = 0,
        output reg[7:0] new_result_value = 0,
        output reg[7:0] new_context = 0
    );
     
     reg[0:0] r_willWrite = 1'b0;
     reg[0:0] new_arrDef = 0;
     reg[0:0] new_arrDef_next = 0;
     reg[7:0] new_array_code = 0; 
     reg[7:0] new_array_code_next = 0;
     reg[0:0] new_eltDef = 0;
     reg[0:0] new_eltDef_next = 0;
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
     reg[0:0] new_bool_next = 0;
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
    // 7: emramge    
    
    always @ (posedge clk)
        begin
                if (r_willWrite) begin
                    new_arrDef <= new_arrDef_next;
                    new_array_code <= new_array_code_next;
                    new_eltDef <= new_eltDef_next;
                    new_rank <= new_rank_next;
                    new_low <= new_low_next;
                    new_high <= new_high_next;
                    new_index <= new_index_next;
                    new_value <= new_value_next;
                end
                new_bool <= new_bool_next;
                new_result_value <= new_result_value_next;
                new_context <= new_context_next;
     
    end
            
            
    always @* begin
               r_willWrite = 1'b0;
               if (selector == 8'b0) begin
                    new_bool_next = (metadata == handle) && isMetadata;
               
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
                if (selector == 8'b1) begin
                
                    new_bool_next = (index == inserted_index) && (metadata >= new_low_next) && (metadata <= new_high) && (isMetadata);
                    new_result_value_next = new_value;
                    new_context_next = new_rank;
                end
                if (selector == 8'b10) begin
                    
                    new_bool_next = (!(!isMetadata || metadata > 7)) && (new_arrDef) && (isMetadata) && (metadata  == handle);
                    new_result_value_next = new_array_code;
                    new_context_next = new_array_code;
                end
                if (selector == 8'b11) begin
                   if (inserted_index == handle) begin   
                        if (isMetadata) begin    
                            new_array_code_next = metadata + 1;
                            new_high_next = metadata + 1;
                            new_low_next = metadata + 1;
                            new_rank_next = inserted_value + 1;
                        end
                   end else begin     
                        if (new_array_code > metadata && isMetadata && new_arrDef) begin 
                            new_array_code_next = new_array_code + 1;
                        end
                        if (new_eltDef && isMetadata) begin 
                            if (new_low > metadata) begin 
                                new_low_next = new_low + 1;
                            end
                            if (new_high >= metadata) begin 
                                new_high_next = new_high + 1;
                            end
                        end
                   end
                    r_willWrite = 1'b1;
                end
                if (selector == 8'b100) begin
                   if (inserted_index == handle) begin   
                        if (isMetadata) begin    
                            new_arrDef_next = 1'b0;
                            new_rank_next = 0;
                        end
                    if (new_eltDef && isMetadata && metadata < new_low) begin  
                        new_high_next = new_high - 1;
                        new_low_next = new_low - 1;
                    end else begin   
                        if (new_eltDef && isMetadata && (new_low <= metadata && metadata <= new_high)) begin 
                            new_high_next = new_high - 1;
                        end
                    end
                    if (new_eltDef && new_low_next > new_high_next) begin 
                        new_eltDef_next = 1'b0;
                        new_arrDef_next = 1'b0;
                    end
                    if (arrDef && isMetadata && new_array_code > metadata) begin 
                        new_array_code_next = new_array_code - 1;
                    end

                    r_willWrite = 1'b1;
                end
                if (selector == 8'b101) begin
                    
                    new_bool_next = ! new_eltDef;
                    new_result_value_next = handle;
                    new_context_next = handle;
                end
                if (selector == 8'b110) begin
                
                    new_bool_next = (!(!isMetadata || metadata > 7)) && (new_arrDef) && (isMetadata) && (metadata  == handle);
                    new_result_value_next = new_rank;
                    new_context_next = new_rank;
                end  
                if (selector == 8'b111) begin
                
                    new_bool_next = (!(metadata > 7)) && (new_eltDef) && (metadata  == handle);
                    new_result_value_next = isMetadata ? new_high : new_low;
                    new_context_next = result_value_next;
                end 
            end
        end
endmodule




