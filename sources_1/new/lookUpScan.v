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


module lookUp(
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
    
    
    assign resultBool = (index == new_index) && (metadata >= low) && (metadata <= high) && (isMetadata);
    
    assign resultValue = value;
    assign resultContext = rank;
endmodule

