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
        output reg[7:0] returnValue = 1'b0,
        output reg[0:0] programIsRunning = 1'b1
    );
   
    
    wire highestInstruction = 1;
    reg[0:0] programIsCorrect = 1'b1;
    
    reg [5:0] counter = 6'b0;
    
    wire[55:0] data_out;
    
    blk_mem_gen_0 blk_mem(
     .clka(clk),
	.addra(counter), // Bus [15 : 0] 
	.douta(data_out)
    );
    
    wire[0:0] willWrite = data_out[0:0];
    wire[7:0] new_index = data_out[15:8];
    wire[7:0] new_value = data_out[23:16];
    wire[7:0] metadata = data_out[31:24];
    wire[0:0] isMetadata = data_out[32:32];
    wire[7:0] selector = data_out[47:40];
    wire[0:0] resultBool;
    
    wire[0:0] assert = data_out[48:48];
    
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
    
    always @ (posedge clk)
        begin
            if (counter < highestInstruction && programIsRunning == 1'b1) begin
                if (assert) begin
                    if ((resultBool != isMetadata) || (resultValue != metadata)) begin
                        // program is incorrect
                        returnValue = counter; // send over UART the offending instruction 
                        programIsCorrect = 1'b0;
                        programIsRunning = 1'b0;
                    end else begin
                        counter = counter + 1;
                    end
                end else begin
                    counter = counter + 1;
                end
            end else begin
                if (programIsRunning == 1'b1 && programIsCorrect == 1'b1 && counter >= highestInstruction) begin
                    returnValue = 'h1E;
                    programIsRunning = 1'b0;
                end
            end
        end
endmodule
