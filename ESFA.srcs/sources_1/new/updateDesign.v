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
    
    wire noElementDefined;
    assign noElementDefined = ! arrDef;
    
    wire low_inc;
    assign low_inc = array_code + 1;
    wire high_inc;
    assign high_inc = array_code + 1;
    wire rank_inc;
    assign rank_inc = rank + 1;
    wire code_inc;
    assign code_inc = array_code + 1;
    
    assign resultBool = (noElementDefined && ! isMetadata);
    assign resultValue = handle; 
    assign out_arrDef = resultBool;    
    assign out_array_code = isHandle ? code_inc : handle;
    assign out_eltDef = 1'b1;
    assign out_rank = isHandle ? rank_inc : 1;
    assign out_low = isHandle ? low_inc : handle;
    assign out_high = isHandle ? high_inc : handle;
    assign out_index = index;
    assign out_value = value;
    assign out_mark = 1'b1;
    
    
endmodule
