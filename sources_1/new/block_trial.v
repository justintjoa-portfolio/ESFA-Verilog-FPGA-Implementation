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
    
    wire highestInstruction = 0;
    
    reg counter[7:0] = 0;
    
    wire[55:0] data_out;
    
    blk_mem_gen_0(
     .clka(clk),
	.addra(counter), // Bus [15 : 0] 
	.douta(data_out)
    );
    
    reg willWrite[0:0] = 1'b0;
    wire new_index[7:0] = data_out[15:8];
    wire new_value[7:0] = data_out[23:16];
    wire metadata[7:0] = data_out[31:24];
    wire isMetadata[0:0] = data_out[32:32];
    wire selector[7:0] = data_out[47:40];
    wire resultBool[0:0];
    wire resultValue[7:0];
    
    wire assert[0:0] = data_out[48:48];
    
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
            if (counter < highestInstruction) begin
                if (assert) begin
                    if ((resultBool != isMetadata) || (resultValue != metadata)) begin
                        // program is incorrect
                        counter = highestInstruction;
                    end else begin
                        counter = counter + 1;
                    end
                end else begin
                    willWrite = data_out[0:0];
                    counter = counter + 1;
                end
            end
        end
endmodule
