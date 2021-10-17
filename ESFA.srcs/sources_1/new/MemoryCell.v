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
        output resultValue
    );

     wire in_clk;
     wire in_arrDef;
     wire in_handle;
     wire in_array_code;
     wire in_eltDef;
     wire in_rank;
     wire in_low;  
     wire in_high;
     wire in_index;
     wire in_value;
     wire in_mark;
     
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
    
    
    
endmodule


