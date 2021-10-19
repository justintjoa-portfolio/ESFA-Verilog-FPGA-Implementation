`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2021 01:42:14 PM
// Design Name: 
// Module Name: congrueDownDesign
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


module congrueDownDesign(
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
    
    wire code_dec;
    assign code_dec = array_code - 1;
    
    wire low_dec;
    assign low_dec = low - 1;
    
    wire high_dec;
    assign high_dec = high - 1;
   
   wire willDecrementCode;
   assign willDecrementCode = (arrDef) && isMetadata && (array_code > metadata);
   
   wire willDecrementLow;
   assign willDecrementLow  = (eltDef) && isMetadata && (metadata < low);
   
   wire willDecrementHigh;
   assign willDecrementHigh = eltDef && ((metadata < low) || (low <= metadata && metadata <= high)) && isMetadata;
  
   wire negativeSet;
   assign negativeSet = ((out_high - out_low < 0) && eltDef);
    
    assign resultBool = 1'b1;
    assign out_arrDef = negativeSet ? 1'b0 : arrDef;   
    assign out_array_code = willDecrementCode ? code_dec : array_code;
    assign out_eltDef = negativeSet ? 1'b0 : eltDef;
    assign out_rank = rank;
    assign out_low = willDecrementLow ? low_dec : low;
    assign out_high = willDecrementHigh ? high_dec : high;
    assign out_index = index;
    assign out_value = value;
    assign out_mark = 1'b0;
endmodule
