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
        input[0:0] clk
    );
    
    
    
    reg programIsRunning[0:0] = 1'b1;
    reg programIsCorrect[0:0] = 1'b1;
    
    reg counter[7:0] = 0;
    
    wire[63:0] data_out;
    
    blk_mem_gen_0(
     .clka(clk),
	.addra(counter), // Bus [15 : 0] 
	.douta(data_out)
    );
    
    reg willWrite[0:0] = 1'b0;
    reg new_index[7:0] = 0;
    reg new_value[7:0] = 0;
    reg metadata[7:0] = 0;
    reg isMetadata[0:0] = 1'b0;
    reg selector[7:0] = 0;
    wire resultBool[0:0];
    wire resultValue[7:0];
    
    ESFADesign(
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
            programIsRunning = data_out[0:0];
            if (programIsCorrect == 1'b0) begin
                programIsRunning = 1'b0;
            end
            if (programIsRunning == 1'b1) begin
                counter = counter + 1;
            end
        end
endmodule
