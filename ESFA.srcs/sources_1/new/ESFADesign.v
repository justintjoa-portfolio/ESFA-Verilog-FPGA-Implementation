`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2021 08:53:11 PM
// Design Name: 
// Module Name: ESFADesign
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


module ESFADesign(
    input new_index,
    input new_value,
    input queried_handle,
    input isHandle,
    output resultBool,
    output resultValue,
    input selector
    );
    
    MemoryCell c0;
    MemoryCell c1;
    MemoryCell c2;
    MemoryCell c3;
    MemoryCell c4;
    MemoryCell c5;
    MemoryCell c6;
    reg metadata;
    reg isMetadata;
    
endmodule
