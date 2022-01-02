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


    wire [7:0] tx_byte = 'h1e; // byte to transmit
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
    
    UART uart(
        .uart_tx(UART_TXD),     // UART transmit wire
        .uart_wr_i(xmitnow),   // Raise to transmit byte
        .uart_dat_i(tx_byte),  // 8-bit data
        .sys_clk_i(clk),   // System clock, 68 MHz
        .sys_rst_i(reset)    // System reset
    );

    always @ (posedge clk)
        begin
            if (reset && ! uart.uart_busy) begin
                reset = 1'b0;
            end
            if (! didTransmit && ! reset) begin
                xmitnow = 1'b1;
                didTransmit = 1'b1;
            end
            if (uart.uart_busy && ! reset) begin 
                xmitnow = 1'b0;
            end
        end  
    
    
endmodule
