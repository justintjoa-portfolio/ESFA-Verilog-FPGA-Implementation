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
        input[7:0] handle,
        input[7:0] array_code,
        input[0:0] eltDef,
        input[7:0] rank,
        input[7:0] low,
        input[7:0] high,
        input[7:0] index,
        input[7:0] value,
        input[0:0] mark,
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
        output[7:0] out_value,
        output[0:0] out_mark
    );
  
    wire prev_code_inc;
    assign prev_code_inc = metadata + 1;
    
    wire present_code_inc;
    assign present_code_inc = array_code + 1;
    
    wire low_inc;
    assign low_inc = low + 1;
    
    wire high_inc;
    assign high_inc = high + 1;
    
    wire willIncrementOwnCode;
    assign willIncrementOwnCode = (array_code > metadata) && (isMetadata) && (arrDef);
    
    wire low_high;
    assign low_high = (eltDef) && isMetadata && (low > metadata);
    
    wire high_high;
    assign high_high = (eltDef) && isMetadata && (high >= metadata);
  
   
    assign resultBool = 1'b1;
    assign out_arrDef = arrDef;   
    assign out_array_code = (new_index == handle) ? 
                             isMetadata ? prev_code_inc : handle
                            : willIncrementOwnCode ? present_code_inc : array_code;
                            
    assign out_eltDef = eltDef;
    assign out_rank = (new_index == handle) ? 
                        isMetadata ? (new_value + 1) : 1 
                     : rank;
    assign out_low = (new_index == handle) ? 
                        isMetadata ? prev_code_inc : handle 
                        : low_high ? low_inc : low;
    assign out_high = (new_index == handle) ? 
                        isMetadata ? prev_code_inc : handle
                        : high_high ? high_inc : high;
    assign out_index = index;
    assign out_value = value;
    assign out_mark = 1'b0;
    assign resultValue = 0;
    assign resultContext = 0;
endmodule
