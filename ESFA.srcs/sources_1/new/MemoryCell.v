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
        input new_handle,
        input a_isHandle,
        input metadata,
        input isMetadata,
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
     
     wire out_clk;
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
    
    updateDesign updater;
   lookUpScan lookScan;
   lookupFinalizer lookFinalizer;
   encode encoder;
   deleteDesign deleter;
   congrueUpDesign upEqualizer;
    congrueDownDesign downEqualizer; 
    
    
    
endmodule


