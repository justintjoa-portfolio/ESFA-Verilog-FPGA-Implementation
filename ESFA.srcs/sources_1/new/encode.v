`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2021 07:52:08 PM
// Design Name: 
// Module Name: encode
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


module encode(
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
    
    wire outOfScope;
    assign outOfScope = (queried_handle > 7);
    
    assign resultBool = (!outOfScope) && (arrDef) && (queried_handle  == handle);
    assign resultValue = array_code;  
    assign out_arrDef = arrDef; 
    assign out_array_code = array_code;
    assign out_eltDef = eltDef;
    assign out_rank = rank;
    assign out_low = low;
    assign out_high = high;
    assign out_index = index;
    assign out_value = value;
    assign out_mark = 1'b0;
    
endmodule
