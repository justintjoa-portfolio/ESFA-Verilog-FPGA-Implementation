`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2021 01:40:57 PM
// Design Name: 
// Module Name: updateDesign
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


module updateDesign(
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
        
    wire rank_inc;
    assign rank_inc = rank + 1;
    wire code_inc;
    assign code_inc = array_code + 1;
    
    assign resultBool = (metadata == handle) && isMetadata && (!arrDef) && (!eltDef);
    assign resultValue = out_array_code;
    assign resultContext = out_array_code;
    assign out_arrDef = resultBool ? 1'b1 : arrDef; 
    assign out_array_code = resultBool ?
                            isMetadata ? code_inc : handle
                            : array_code;
    assign out_eltDef = resultBool ? 1'b1 : eltDef;
    assign out_rank = resultBool ?
                      isMetadata ? rank_inc : 1
                      : rank;
    assign out_low = resultBool ?
                        isMetadata ? code_inc : handle
                        : low;
    assign out_high = resultBool ?        
                        isMetadata ? code_inc : handle 
                        : high;
    assign out_index = resultBool ? new_index : index;
    assign out_value = resultBool ? new_value : value;
    assign out_mark = resultBool;
    
    
endmodule
