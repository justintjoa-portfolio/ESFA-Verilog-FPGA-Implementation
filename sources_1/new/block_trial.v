`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2021 11:32:28 PM
// Design Name: 
// Module Name: block_trial
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


module block_trial(
        input[0:0] clk,
        input[55:0] data_in,
        output wire[55:0] data_out
    );
   
    wire[0:0] willWrite = data_in[0:0];
    wire[7:0] new_index = data_in[15:8];
    wire[7:0] new_value = data_in[23:16];
    wire[7:0] metadata = data_in[31:24];
    wire[0:0] isMetadata = data_in[32:32];
    wire[7:0] selector = data_in[47:40];
    
    wire[0:0] assert = data_in[48:48];
    
    assign data_out[7:0] = resultBool;
    assign data_out[15:8] = resultValue;
    assign data_out[55:16] = 40'b0;
    
    ESFADesign l1(
    .clk(clk),
    .in_willWrite(willWrite),
    .new_index(new_index),
    .new_value(new_value),
    .metadata(metadata),
    .isMetadata(isMetadata),
    .selector(selector),
    .resultBool(resultBool),
    .resultValue(resultValue)
    );
    
endmodule
