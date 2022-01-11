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
        input[0:0] willWrite,
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
     
     reg[0:0] new_arrDef, new_arrDef_next = 0;
     reg[7:0] new_array_code, new_array_code_next = 0;
     reg[0:0] new_eltDef, new_eltDef_next = 0;
     reg[7:0] new_rank, new_rank_next = 0;
     reg[7:0] new_low, new_low_next = 0;
     reg[7:0] new_high, new_high_next = 0;
     reg[7:0] new_index, new_index_next = 0;
     reg[7:0] new_value, new_value_next = 0;
     reg[0:0] new_bool_next = 0;
     reg[7:0] new_result_value_next, new_context_next = 0;
    

   
    
    // output wires for each combinator block
    wire[0:0] a_resultBool, a_arrDef, a_eltDef;
    wire [7:0] a_resultValue, a_resultContext, a_array_code, a_rank, a_low, a_high, a_index, a_value;

    wire[0:0] b_resultBool;
    wire [7:0] b_resultValue, b_resultContext;
    
    wire[0:0] c_resultBool;
    wire [7:0] c_resultValue, c_resultContext;
    
    wire[0:0] d_resultBool, d_arrDef, d_eltDef;
    wire [7:0] d_resultValue, d_resultContext, d_array_code, d_rank, d_low, d_high, d_index, d_value;
    
    wire[0:0] e_resultBool, e_arrDef, e_eltDef;
    wire [7:0] e_resultValue, e_resultContext, e_array_code, e_rank, e_low, e_high, e_index, e_value;
    
    wire[0:0] f_resultBool;
    wire [7:0] f_resultValue, f_resultContext;
    
    wire[0:0] g_resultBool;
    wire [7:0] g_resultValue, g_resultContext;
    
    wire[0:0] h_resultBool;
    wire [7:0] h_resultValue, h_resultContext;
    
   updateDesign updater(new_arrDef, handle, new_array_code, new_eltDef, new_rank, new_low, new_high, new_index, new_value, inserted_index, inserted_value, 
   metadata, isMetadata, a_resultBool, a_resultValue, a_resultContext, a_arrDef, a_array_code, a_eltDef, a_rank, a_low, a_high, a_index, a_value);
   
   lookUp lookScan(new_arrDef, handle, new_array_code, new_eltDef, new_rank, new_low, new_high, new_index, new_value, inserted_index, inserted_value, 
   metadata, isMetadata, b_resultBool, b_resultValue, b_resultContext);
   
   encode encoder(new_arrDef, handle, new_array_code, new_eltDef, new_rank, new_low, new_high, new_index, new_value, inserted_index, inserted_value, 
   metadata, isMetadata, c_resultBool, c_resultValue, c_resultContext);
   
   
   congrueUpDesign upEqualizer(new_arrDef, handle, new_array_code, new_eltDef, new_rank, new_low, new_high, new_index, new_value, inserted_index, inserted_value, 
   metadata, isMetadata, d_resultBool, d_resultValue, d_resultContext, d_arrDef, d_array_code, d_eltDef, d_rank, d_low, d_high, d_index, d_value);
   
   congrueDownDesign downEqualizer(new_arrDef, handle, new_array_code, new_eltDef, new_rank, new_low, new_high, new_index, new_value, inserted_index, inserted_value,
   metadata, isMetadata, e_resultBool, e_resultValue,  e_resultContext, e_arrDef, e_array_code, e_eltDef, e_rank, e_low, e_high, e_index, e_value);
   
   markAvailableCell vacantCellMarker(new_arrDef, handle, new_array_code, new_eltDef, new_rank, new_low, new_high, new_index, new_value, inserted_index, inserted_value,
   metadata, isMetadata, f_resultBool, f_resultValue, f_resultContext);
    
   enrank enranker(new_arrDef, handle, new_array_code, new_eltDef, new_rank, new_low, new_high, new_index, new_value, inserted_index, inserted_value,
   metadata, isMetadata, g_resultBool, g_resultValue,  g_resultContext); 
   
   enRange enranger(new_arrDef, handle, new_array_code, new_eltDef, new_rank, new_low, new_high, new_index, new_value, inserted_index, inserted_value,
   metadata, isMetadata, h_resultBool, h_resultValue,  h_resultContext); 
   
    //Map
    // 0 : update  
    // 1 : lookUpScan    
    // 2 : lookUpFinalizer   
    // 3: encode      
    // 4: delete   
    // 5: congrueUp  
    // 6: congruedown 
    // 7: markAvailableCell    
    
    always @ (posedge clk)
        begin
                if (willWrite) begin
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
               if (selector == 8'b0) begin
                    if (willWrite) begin
                        new_arrDef_next = a_arrDef;
                        new_array_code_next = a_array_code;
                        new_eltDef_next = a_eltDef;
                        new_rank_next = a_rank;
                        new_low_next = a_low;
                        new_high_next = a_high;
                        new_index_next = a_index;
                        new_value_next = a_value;
                    end
                
                    new_bool_next = a_resultBool;
                    new_result_value_next = a_resultValue;
                    new_context_next = a_resultContext;
                end
                if (selector == 8'b1) begin
                
                    new_bool_next = b_resultBool;
                    new_result_value_next = b_resultValue;
                    new_context_next = b_resultContext;
                end
                if (selector == 8'b10) begin
                    
                    new_bool_next = c_resultBool;
                    new_result_value_next = c_resultValue;
                    new_context_next = c_resultContext;
                end
                if (selector == 8'b11) begin
                    if (willWrite) begin
                        new_arrDef_next = d_arrDef;
                        new_array_code_next = d_array_code;
                        new_eltDef_next = d_eltDef;
                        new_rank_next = d_rank;
                        new_low_next = d_low;
                        new_high_next = d_high;
                        new_index_next = d_index;
                        new_value_next = d_value;
                    end
                
                    new_bool_next = d_resultBool;
                    new_result_value_next = d_resultValue;
                    new_context_next = d_resultContext;
                end
                if (selector == 8'b100) begin
                    if (willWrite) begin
                        new_arrDef_next = e_arrDef;
                        new_array_code_next = e_array_code;
                        new_eltDef_next = e_eltDef;
                        new_rank_next = e_rank;
                        new_low_next = e_low;
                        new_high_next = e_high;
                        new_index_next = e_index;
                        new_value_next = e_value;
                    end
                
                    new_bool_next = e_resultBool;
                    new_result_value_next = e_resultValue;
                    new_context_next = e_resultContext;
                end
                if (selector == 8'b101) begin
                    
                    new_bool_next = f_resultBool;
                    new_result_value_next = f_resultValue;
                    new_context_next = f_resultContext;
                end
                if (selector == 8'b110) begin
                
                    new_bool_next = g_resultBool;
                    new_result_value_next = g_resultValue;  
                    new_context_next = g_resultContext;
                end  
                if (selector == 8'b111) begin
                
                    new_bool_next = h_resultBool;
                    new_result_value_next = h_resultValue;  
                    new_context_next = h_resultContext;
                end 
    end
endmodule




