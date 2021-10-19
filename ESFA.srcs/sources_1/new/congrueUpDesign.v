`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2021 01:41:59 PM
// Design Name: 
// Module Name: congrueUpDesign
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


module congrueUpDesign(
        input[0:0] arrDef,
        input handle,
        input array_code,
        input[0:0] eltDef,
        input rank,
        input low,
        input high,
        input index,
        input value,
        input[0:0] mark,
        input new_index,
        input new_value,
        input queried_handle,
        input isHandle,
        input metadata,
        input isMetadata,
        output[0:0] resultBool,
        output resultValue,
        output resultContext,
        output[0:0] out_arrDef,
        output out_array_code,
        output[0:0] out_eltDef,
        output out_rank,
        output out_low,
        output out_high,
        output out_index,
        output out_value,
        output[0:0] out_mark
    );
    
    wire noOp;
    assign noOp = mark;
    
    wire code_inc;
    assign code_inc = array_code + 1;
    
    wire willIncrementCode;
    assign willIncrementCode = (array_code > metadata) && (arrDef);
    
    wire low_inc;
    assign low_inc = low + 1;
    
    wire high_inc;
    assign high_inc = high + 1;
    
    wire low_high;
    assign low_high = (eltDef) && (low > metadata);
    
    wire high_high;
    assign high_high = (eltDef) && (high >= metadata);
  
   
    assign resultBool = 1'b1;
    assign out_arrDef = arrDef;   
    assign out_array_code = noOp ? array_code :
        willIncrementCode ? code_inc : array_code;
    assign out_eltDef = eltDef;
    assign out_rank = rank;
    assign out_low = noOp ? low :
        low_high ? low_inc : low;
    assign out_high = noOp ? high :
        high_high ? high_inc : high;
    assign out_index = index;
    assign out_value = value;
    assign out_mark = 1'b0;
endmodule
