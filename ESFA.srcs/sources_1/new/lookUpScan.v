`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2021 01:42:51 PM
// Design Name: 
// Module Name: lookupDesign
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


module lookUpScan(
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
        input preceding_context,
        input[0:0] has_result,
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
    
    wire isCandidate;
    assign isCandidate = (index == new_index) && (metadata >= low) && (metadata <= high) && (isMetadata);
    
    
    assign resultBool = 1'b1;
    assign out_arrDef = arrDef; 
    assign out_array_code = array_code;
    assign out_eltDef = eltDef;
    assign out_rank = rank;
    assign out_low = low;
    assign out_high = high;
    assign out_index = index;
    assign out_value = value;
    assign out_mark = isCandidate;
endmodule

