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
        input[7:0] handle,
        input[7:0] array_code,
        input[0:0] eltDef,
        input[7:0] rank,
        input[7:0] low,
        input[7:0] high,
        input[7:0] index,
        input[7:0] value,
        input[7:0] new_index,
        input[7:0] new_value,
        input[7:0] metadata,
        input[0:0] isMetadata,
        output[0:0] resultBool,
        output[7:0] resultValue,
        output[7:0] resultContext, 
        output[0:0] out_arrDef,
        output[7:0] out_array_code,
        output[0:0] out_eltDef,
        output[7:0] out_rank,
        output[7:0] out_low,
        output[7:0] out_high,
        output[7:0] out_index,
        output[7:0] out_value
    );
    
    wire isTargetedArray = (isMetadata && new_index == handle);
    
    wire[7:0] code_dec;
    assign code_dec = array_code - 1;
    
    wire[7:0] low_dec;
    assign low_dec = low - 1;
    
    wire[7:0] high_dec;
    assign high_dec = high - 1;
   
   wire willDecrementCode;
   assign willDecrementCode = (arrDef) && isMetadata && (array_code > metadata);
   
   wire willDecrementLow;
   assign willDecrementLow  = (eltDef) && isMetadata && (metadata < low);
   
   wire willDecrementHigh;
   assign willDecrementHigh = eltDef && ((metadata < low) || (low <= metadata && metadata <= high)) && isMetadata;
  
   wire negativeSet;
   assign negativeSet = ((out_low > out_high) && eltDef);
    
    assign resultBool = 1'b1;
    assign out_arrDef = 
    isTargetedArray ? 
        1'b0
        : negativeSet ? 
            1'b0 
            : arrDef;   
    assign out_array_code = willDecrementCode ? code_dec : array_code;
    assign out_eltDef = negativeSet ? 
            1'b0 
            : eltDef; 
    assign out_rank = isTargetedArray ? 1'b0 : rank;
    assign out_low = willDecrementLow ? low_dec : low;
    assign out_high = willDecrementHigh ? high_dec : high;
    assign out_index = index;
    assign out_value = value;
    assign resultValue = 0;
    assign resultContext = 0;
endmodule