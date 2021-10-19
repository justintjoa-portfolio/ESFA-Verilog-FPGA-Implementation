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
        
    wire rank_inc;
    assign rank_inc = rank + 1;
    wire code_inc;
    assign code_inc = array_code + 1;
    
    assign resultBool = (metadata == handle) && isMetadata;
    assign resultValue = handle; 
    assign resultContext = out_array_code;
    assign out_arrDef = resultBool ? 1'b1 : arrDef; 
    assign out_array_code = resultBool ?
                            isHandle ? code_inc : handle
                            : array_code;
    assign out_eltDef = resultBool ? 1'b1 : eltDef;
    assign out_rank = resultBool ?
                      isHandle ? rank_inc : 1
                      : rank;
    assign out_low = resultBool ?
                        isHandle ? code_inc : handle
                        : low;
    assign out_high = resultBool ?        
                        isHandle ? code_inc : handle 
                        : high;
    assign out_index = resultBool ? new_index : index;
    assign out_value = resultBool ? new_value : value;
    assign out_mark = resultBool;
    
    
endmodule
