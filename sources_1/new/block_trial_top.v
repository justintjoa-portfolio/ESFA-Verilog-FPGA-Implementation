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
    reg [7:0] tx_byte = 8'b0; // byte to transmit
    reg xmitnow=1'b0; // transmit signal
    wire[0:0] programIsRunning;
    
    reg[0:0] didTransmit = 1'b0;
    
    reg[0:0] reset = 1'b1;
    
    /*
    block_trial bt(
    .clk(clk),
    .returnValue(tx_byte),
    .programIsRunning(programIsRunning));
    */
    
    UART #(
        .baud_rate(9600), // default is 9600
        .sys_clk_freq(12000000) // default is 100000000
    )
    UART0(
        .clk(clk), // The master clock for this module
        .rst(reset), // Synchronous reset
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
            if (reset && ! UART0.is_transmitting && ! UART0.is_receiving) begin
                reset = 1'b0;
            end
            /*
            if (!didTransmit && !programIsRunning && ! reset) begin
                xmitnow = 1'b1;
                didTransmit = 1'b1;
            end 
            if (UART0.is_transmitting && ! reset) begin 
                xmitnow = 1'b0;
            end
            */
            if (UART0.received && ! reset) begin
                tx_byte = rx_byte;
                xmitnow = 1'b1;
            end
            if (UART0.is_transmitting && ! reset) begin 
                xmitnow = 1'b0;
            end
        end  
    
    
endmodule
