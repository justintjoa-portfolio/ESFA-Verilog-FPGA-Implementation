`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2021 08:53:11 PM
// Design Name: 
// Module Name: ESFADesign
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


module ESFADesign(
    input arrDef,
    input handle,
    input array_code,
    input eltDef,
    input rank,
    input low,
    input high,
    input index,
    input value,
    input mark,
    input new_index,
    input new_value,
    input new_handle,
    input a_isHandle,
    input metadata,
    output resultBool,
    output resultValue,
    output out_arrDef,
    output out_handle,
    output out_array_code,
    output out_eltDef,
    output out_rank,
    output out_low,
    output out_high,
    output out_index,
    output out_value,
    output out_mark,
    input selectorBit1,
    input selectorBit2,
    input selectorBit3
    );
    
    wire low_dec;
    assign low_dec = low - 1;
    wire high_dec;
    assign high_dec = high - 1;
    wire low_inc;
    assign low_inc = low + 1;
    wire high_inc;
    assign high_inc = high + 1;
    
    wire code_dec;
    assign code_dec = array_code - 1;
    wire code_inc;
    assign code_inc = array_code + 1;
    
    wire rank_inc;
    assign rank_inc = rank + 1;
    
    wire code_Bigger;
    assign code_Bigger  = array_code > metadata;
    
    wire low_higher;
    assign low_higher = low > metadata;
    
    wire high_higher;
    assign high_higher = high > metadata;
   
    
endmodule
