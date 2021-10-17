`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2021 10:07:22 PM
// Design Name: 
// Module Name: lookUpFinalizer
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


module lookUpFinalizer(
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
        input preceding_result,
        output[0:0] resultBool,
        output resultValue,
        output[0:0] out_arrDef,
        output out_array_code,
        output[0:0] out_eltDef,
        output out_rank,
        output out_low,
        output out_high,
        output out_index,
        output out_value,
        output[0:0] out_mark,
        output out_metadata,
        output[0:0] out_isMetadata
    );
    
    wire isCandidate;
    assign isCandidate = mark;
    
    wire isSuperior;
    assign isSuperior = (mark) && (metadata > rank);
    
    assign resultBool = out_isMetadata;
    assign resultValue = isSuperior ? value : preceding_result;
    assign out_arrDef = arrDef;   
    assign out_array_code = array_code;
    assign out_eltDef = eltDef;
    assign out_rank = rank;
    assign out_low = low;
    assign out_high = high;
    assign out_index = index;
    assign out_value = value;
    assign out_mark = 1'b0;
    assign out_metadata = isSuperior ? rank : metadata;
    assign out_isMetadata = isMetadata || mark;
endmodule
