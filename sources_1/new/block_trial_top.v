`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/31/2021 10:14:58 PM
// Design Name: 
// Module Name: block_trial_top
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


module block_trial_top(
        input[0:0] clk,
        input UART_RXD,
        output UART_TXD
    );
    
    wire isrx;   // Uart sees something!
    wire [7:0] rx_byte;  // Uart data
    wire [7:0] tx_byte; // byte to transmit
    reg xmitnow=1'b0; // transmit signal
    
    block_trial bt(
    .clk(clk),
    .returnValue(tx_byte));
    
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
    
    
    
endmodule
