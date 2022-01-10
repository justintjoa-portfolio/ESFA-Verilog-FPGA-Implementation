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


module enRange(
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
        output[7:0] resultContext
    );
    
    wire outOfScope;
    assign outOfScope = (!isMetadata || metadata > 7);
    
    assign resultBool = (!outOfScope) && (eltDef) && (metadata  == handle);
    assign resultValue = isMetadata ? high : low;
    assign resultContext = resultValue;
    
endmodule