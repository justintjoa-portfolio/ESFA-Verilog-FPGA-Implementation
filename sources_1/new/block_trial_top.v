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


    reg [7:0] tx_byte = 8'b0; // byte to transmit
    wire [7:0] rx_byte;
    reg xmitnow=1'b0; // transmit signal
    wire[0:0] programIsRunning;
    
    reg[0:0] didTransmit = 1'b0;
    
    reg[0:0] reset = 1'b1;
    reg[0:0] ackReceipt = 1'b0;
    wire[0:0] dataReceived;
    /*
    block_trial bt(
    .clk(clk),
    .returnValue(tx_byte),
    .programIsRunning(programIsRunning));
    */
    
    UART #(.CLOCK_SCALE (26))

    uart (.masterClock   (clk),
          .reset         (reset),

          // ---------------------------------------------
          // Transmitter
          // ---------------------------------------------
          .txData        (tx_byte),
          .txRequest     (xmitnow),
          .tx            (UART_TXD),

          // ---------------------------------------------
          // Receiver
          // ---------------------------------------------
          .clearDR       (ackReceipt),
          .dataReceived(dataReceived),
          .rx            (UART_RXD),
          .rxData        (rx_byte)
          );

    always @ (posedge clk)
        begin
            if (reset) begin
                reset = 1'b0;
            end else begin  
                if (dataReceived) begin
                    tx_byte = rx_byte;
                    ackReceipt = 1'b1;
                    xmitnow = 1'b1;
                end
                if (uart.txActive) begin
                    xmitnow = 1'b0;
                end
            end
        end  
    
    
endmodule
