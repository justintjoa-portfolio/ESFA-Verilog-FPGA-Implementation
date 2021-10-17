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
        input clk,
        input new_index,
        input new_value,
        input queried_handle,
        input a_isHandle,
        input metadata,
        input isMetadata,
        input preceding_result,
        input selector,
        output resultBool,
        output resultValue,
        output out_isMetadata,
        output out_metadata
    );

     wire in_clk;
     wire in_arrDef;
     wire in_array_code;
     wire in_eltDef;
     wire in_rank;
     wire in_low;  
     wire in_high;
     wire in_index;
     wire in_value;
     wire in_mark;
     
     reg new_arrDef;
     reg new_array_code;
     reg new_eltDef;
     reg new_rank;
     reg new_low;
     reg new_high;
     reg new_index;
     reg new_value;
     reg new_mark;
     reg new_bool;
     reg new_value;
     reg new_isMetadata;
     reg new_metadata;
     
     // Output of MemoryCellTupleRegs
     wire out_arrDef;
     wire out_handle;
     wire out_array_code;
     wire out_eltDef;
     wire out_rank;
     wire out_low;  
     wire out_high;
     wire out_index;
     wire out_value;
     wire out_mark;
     
    assign resultBool = new_bool;
    assign resultValue = new_value;
    assign out_isMetadata = new_isMetadata;
    assign out_metadata = new_metadata;
   
    
    MemoryCellTupleRegs regs(in_clk, in_arrDef, in_handle, in_array_code, in_eltDef, in_rank, in_low, in_high, in_index, in_value, in_Mark, out_arrDef, out_handle,
    out_array_code, out_eltDef, out_rank, out_low, out_high, out_index, out_value, out_mark);
    
    // output wires for each combinator block
    wire a_resultBool, a_resultValue,  a_arrDef, a_array_code, a_eltDef, a_rank, a_low, a_high, a_index, a_value, a_mark, a_metadata, a_isMetadata;
    wire b_resultBool, b_resultValue,  b_arrDef, b_array_code, b_eltDef, b_rank, b_low, b_high, b_index, b_value, b_mark, b_metadata, b_isMetadata;
    wire c_resultBool, c_resultValue,  c_arrDef, c_array_code, c_eltDef, c_rank, c_low, c_high, c_index, c_value, c_mark, c_metadata, c_isMetadata;
    wire d_resultBool, d_resultValue,  d_arrDef, d_array_code, d_eltDef, d_rank, d_low, d_high, d_index, d_value, d_mark, d_metadata, d_isMetadata;
    wire e_resultBool, e_resultValue,  e_arrDef, e_array_code, e_eltDef, e_rank, e_low, e_high, e_index, e_value, e_mark, e_metadata, e_isMetadata;
    wire f_resultBool, f_resultValue,  f_arrDef, f_array_code, f_eltDef, f_rank, f_low, f_high, f_index, f_value, f_mark, f_metadata, f_isMetadata;
    wire g_resultBool, g_resultValue,  g_arrDef, g_array_code, g_eltDef, g_rank, g_low, g_high, g_index, g_value, g_mark, g_metadata, g_isMetadata;
    
   updateDesign updater(out_arrDef, out_handle, out_array_code, out_eltDef, out_rank, out_low, out_high, out_index, out_value, out_mark, new_index, new_value, queried_handle, isHandle,
   metadata, isMetadata, preceding_result, a_resultBool, a_resultValue,  a_arrDef, a_array_code, a_eltDef, a_rank, a_low, a_high, a_index, a_value, a_mark, a_metadata, a_isMetadata);
   
   lookUpScan lookScan(out_arrDef, out_handle, out_array_code, out_eltDef, out_rank, out_low, out_high, out_index, out_value, out_mark, new_index, new_value, queried_handle, isHandle,
   metadata, isMetadata, preceding_result, b_resultBool, b_resultValue,  b_arrDef, b_array_code, b_eltDef, b_rank, b_low, b_high, b_index, b_value, b_mark, b_metadata, b_isMetadata);
   
   lookUpFinalizer lookFinalizer(out_arrDef, out_handle, out_array_code, out_eltDef, out_rank, out_low, out_high, out_index, out_value, out_mark, new_index, new_value, queried_handle, isHandle,
   metadata, isMetadata, preceding_result, c_resultBool, c_resultValue,  c_arrDef, c_array_code, c_eltDef, c_rank, c_low, c_high, c_index, c_value, c_mark, c_metadata, c_isMetadata);
   
   encode encoder(out_arrDef, out_handle, out_array_code, out_eltDef, out_rank, out_low, out_high, out_index, out_value, out_mark, new_index, new_value, queried_handle, isHandle,
   metadata, isMetadata, preceding_result, d_resultBool, d_resultValue,  d_arrDef, d_array_code, d_eltDef, d_rank, d_low, d_high, d_index, d_value, d_mark, d_metadata, d_isMetadata);
   
   deleteDesign deleter(out_arrDef, out_handle, out_array_code, out_eltDef, out_rank, out_low, out_high, out_index, out_value, out_mark, new_index, new_value, queried_handle, isHandle,
   metadata, isMetadata, preceding_result, e_resultBool, e_resultValue,  e_arrDef, e_array_code, e_eltDef, e_rank, e_low, e_high, e_index, e_value, e_mark, e_metadata, e_isMetadata);
   
   congrueUpDesign upEqualizer(out_arrDef, out_handle, out_array_code, out_eltDef, out_rank, out_low, out_high, out_index, out_value, out_mark, new_index, new_value, queried_handle, isHandle,
   metadata, isMetadata, preceding_result, f_resultBool, f_resultValue,  f_arrDef, f_array_code, f_eltDef, f_rank, f_low, f_high, f_index, f_value, f_mark, f_metadata, f_isMetadata);
   
    congrueDownDesign downEqualizer(out_arrDef, out_handle, out_array_code, out_eltDef, out_rank, out_low, out_high, out_index, out_value, out_mark, new_index, new_value, queried_handle, isHandle,
   metadata, isMetadata, preceding_result, g_resultBool, g_resultValue,  g_arrDef, g_array_code, g_eltDef, g_rank, g_low, g_high, g_index, g_value, g_mark, g_metadata, g_isMetadata); 
    
    
    assign in_arrDef = new_arrDef;
     assign in_array_code = new_array_code;
     assign in_eltDef = new_eltDef;
     assign in_rank = new_rank;
     assign in_low = new_low;
     assign in_high = new_high;
     assign in_index = new_index;
     assign in_value = new_value;
     assign in_mark = new_mark;
    
    
    //Map
    // 0 : update  
    // 1 : lookUpScan    
    // 2 : lookUpFinalizer   
    // 3: encode      
    // 4: delete   
    // 5: congrueUp  
    // 6: congruedown     
    
    always @ (posedge clk)
        begin
            if (selector == 0)
                new_arrDef = a_arrDef;
                new_array_code = a_array_code;
                new_eltDef = a_eltDef;
                new_rank = a_rank;
                new_low = a_low;
                new_high = a_high;
                new_index = a_index;
                new_value = a_value;
                new_mark = a_mark;
                
                resultBool = a_resultBool;
                resultValue = a_resultValue;
                out_isMetadata = a_isMetadataMtadata;
                out_metadata  = a_metadata;
            if (selector == 1)
                new_arrDef = b_arrDef;
                new_array_code = b_array_code;
                new_eltDef = b_eltDef;
                new_rank = b_rank;
                new_low = b_low;
                new_high = b_high;
                new_index = b_index;
                new_value = b_value;
                new_mark = b_mark;
                
                resultBool = b_resultBool;
                resultValue = b_resultValue;
                out_isMetadata = b_isMetadataMtadata;
                out_metadata  = b_metadata;
            if (selector == 2)
                new_arrDef = c_arrDef;
                new_array_code = c_array_code;
                new_eltDef = c_eltDef;
                new_rank = c_rank;
                new_low = c_low;
                new_high = c_high;
                new_index = c_index;
                new_value = c_value;
                new_mark = c_mark;
                
                resultBool = c_resultBool;
                resultValue = c_resultValue;
                out_isMetadata = c_isMetadataMtadata;
                out_metadata  = c_metadata;
            if (selector == 3)
                new_arrDef = d_arrDef;
                new_array_code = d_array_code;
                new_eltDef = d_eltDef;
                new_rank = d_rank;
                new_low = d_low;
                new_high = d_high;
                new_index = d_index;
                new_value = d_value;
                new_mark = d_mark;
                
                resultBool = d_resultBool;
                resultValue = d_resultValue;
                out_isMetadata = d_isMetadataMtadata;
                out_metadata  = d_metadata;
            if (selector == 4)
                new_arrDef = e_arrDef;
                new_array_code = e_array_code;
                new_eltDef = e_eltDef;
                new_rank = e_rank;
                new_low = e_low;
                new_high = e_high;
                new_index = e_index;
                new_value = e_value;
                new_mark = e_mark;
                
                resultBool = e_resultBool;
                resultValue = e_resultValue;
                out_isMetadata = e_isMetadataMtadata;
                out_metadata  = e_metadata;
            if (selector == 5)
                new_arrDef = f_arrDef;
                new_array_code = f_array_code;
                new_eltDef = f_eltDef;
                new_rank = f_rank;
                new_low = f_low;
                new_high = f_high;
                new_index = f_index;
                new_value = f_value;
                new_mark = f_mark;
                
                resultBool = f_resultBool;
                resultValue = f_resultValue;
                out_isMetadata = f_isMetadataMtadata;
                out_metadata  = f_metadata;
            if (selector == 6)   
                new_arrDef = g_arrDef;
                new_array_code = g_array_code;
                new_eltDef = g_eltDef;
                new_rank = g_rank;
                new_low = g_low;
                new_high = g_high;
                new_index = g_index;
                new_value = g_value;
                new_mark = g_mark;  
                
                resultBool = g_resultBool;
                resultValue = g_resultValue;
                out_isMetadata = g_isMetadataMtadata;
                out_metadata  = g_metadata;       
        end
endmodule


