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
        input UART_RXD,
        output UART_TXD
    );
    
    wire highestInstruction = 1;
    reg[0:0] programIsCorrect = 1'b1;
    reg[0:0] programIsRunning = 1'b1;
    
    reg [7:0] counter = 8'b0;
    
    wire[55:0] data_out;
    
    blk_mem_gen_0(
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
    wire[7:0] resultValue;
    
    wire[0:0] assert = data_out[48:48];
    
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
    
    
    
    wire isrx;   // Uart sees something!
    wire[7:0] rx_byte;  // Uart data
    reg[7:0] tx_byte; // byte to transmit
    reg xmitnow=1'b0; // transmit signal
    
    UART #(
        .baud_rate(9600), // default is 9600
        .sys_clk_freq(12000000) // default is 100000000
    )
    UART0(
        .clk(clk), // The master clock for this module
        .rst(), // Synchronous reset
        .rx(UART_RXD), // Incoming serial line
        .tx(UART_TXD), // Outgoing serial line
        .transmit(xmitnow), // Signal to transmit
        .tx_byte(tx_byte), // Byte to transmit
        .received(isrx), // Indicated that a byte has been received
        .rx_byte(rx_byte), // Byte received
        .is_receiving(), // Low when receive line is idle
        .is_transmitting(),// Low when transmit line is idle
        .recv_error() // Indicates error in receiving packet.
    );
   
    
    always @ (posedge clk)
        begin     
            if (counter < highestInstruction && programIsRunning == 1'b1) begin
                if (assert) begin
                    if ((resultBool != isMetadata) || (resultValue != metadata)) begin
                        // program is incorrect
                        tx_byte = counter; // send over UART the offending instruction 
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
                    tx_byte = 0;
                    programIsRunning = 1'b0;
                end
            end
        end
endmodule
