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
     
     reg[0:0] new_arrDef = 0;
     reg[7:0] new_array_code = 0;
     reg[0:0] new_eltDef = 0;
     reg[7:0] new_rank = 0;
     reg[7:0] new_low = 0;
     reg[7:0] new_high = 0;
     reg[7:0] new_index = 0;
     reg[7:0] new_value = 0;
    

   
    
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
                if (selector == 8'b0) begin
                    if (willWrite) begin
                        new_arrDef <= a_arrDef;
                        new_array_code <= a_array_code;
                        new_eltDef <= a_eltDef;
                        new_rank <= a_rank;
                        new_low <= a_low;
                        new_high <= a_high;
                        new_index <= a_index;
                        new_value <= a_value;
                    end
                
                    new_bool <= a_resultBool;
                    new_result_value <= a_resultValue;
                    new_context <= a_resultContext;
                end
                if (selector == 8'b1) begin
                
                    new_bool <= b_resultBool;
                    new_result_value <= b_resultValue;
                    new_context <= b_resultContext;
                end
                if (selector == 8'b10) begin
                    
                    new_bool <= c_resultBool;
                    new_result_value <= c_resultValue;
                    new_context <= c_resultContext;
                end
                if (selector == 8'b11) begin
                    if (willWrite) begin
                        new_arrDef <= d_arrDef;
                        new_array_code <= d_array_code;
                        new_eltDef <= d_eltDef;
                        new_rank <= d_rank;
                        new_low <= d_low;
                        new_high <= d_high;
                        new_index <= d_index;
                        new_value <= d_value;
                    end
                
                    new_bool <= d_resultBool;
                    new_result_value <= d_resultValue;
                    new_context <= d_resultContext;
                end
                if (selector == 8'b100) begin
                    if (willWrite) begin
                        new_arrDef <= e_arrDef;
                        new_array_code <= e_array_code;
                        new_eltDef <= e_eltDef;
                        new_rank <= e_rank;
                        new_low <= e_low;
                        new_high <= e_high;
                        new_index <= e_index;
                        new_value <= e_value;
                    end
                
                    new_bool <= e_resultBool;
                    new_result_value <= e_resultValue;
                    new_context <= e_resultContext;
                end
                if (selector == 8'b101) begin
                    
                    new_bool <= f_resultBool;
                    new_result_value <= f_resultValue;
                    new_context <= f_resultContext;
                end
                if (selector == 8'b110) begin
                
                    new_bool <= g_resultBool;
                    new_result_value <= g_resultValue;  
                    new_context <= g_resultContext;
                end 
                if (selector == 8'b111) begin
                
                    new_bool <= (metadata == handle) ? d_resultBool : 1'b0;
                    new_result_value <= (metadata == handle) ? d_resultValue : 8'b0;  
                    new_context <= (metadata == handle) ? d_resultContext : 8'b0;
                end  
            end
endmodule


