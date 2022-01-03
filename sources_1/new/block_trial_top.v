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
        input clk,
        input UART_RXD,
        output UART_TXD,
        output reg[0:0] led = 1'b0
    );


    reg [7:0] tx_byte = 8'b0; // byte to transmit
    wire [7:0] rx_byte;
    reg xmitnow=1'b0; // transmit signal
    wire[0:0] programIsRunning;
    wire[0:0] received;
    wire[0:0] isReceiving;
    wire[0:0] isTransmitting;
    
    reg[0:0] didTransmit = 1'b0;
    
    reg[0:0] reset = 1'b1;
    reg[0:0] ackReceipt = 1'b0;
    /*
    block_trial bt(
    .clk(clk),
    .returnValue(tx_byte),
    .programIsRunning(programIsRunning));
    */
    
    
    
      UART #(.CLOCK_SCALE (930))

    uart (.masterClock   (clk),
          .reset         (reset),

          // ---------------------------------------------
          // Transmitter
          // ---------------------------------------------
          .txData        (tx_byte),
          .txRequest     (xmitnow),
          .txActive      (isTransmitting),
          .tx            (UART_TXD),

          // ---------------------------------------------
          // Receiver
          // ---------------------------------------------
          .clearDR       (ackReceipt),
          .rx            (UART_RXD),
          .rxData        (rx_byte),
          .dataReceived  (received)
//        .dataOverrun   ()           not monitoring data overrun
          );
    
    
    always @ (posedge clk)
        begin
            if (reset) begin
                reset = 1'b0;
            end else begin  
                if (received && ! isTransmitting) begin
                    led = 1'b1;
                    tx_byte = rx_byte;
                    ackReceipt = 1'b1;
                    xmitnow = 1'b1;
                end else if (isTransmitting) begin
                    xmitnow = 1'b0;
                    ackReceipt = 1'b0;
                end
            end
        end  
    
    
endmodule
