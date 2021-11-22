`timescale 1ns / 1ps
//leverages tutorial from here:
//https://hackaday.com/2018/09/06/fpga-pov-toy-gets-customized/
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2021 01:37:39 PM
// Design Name: 
// Module Name: ESFATop
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


module ESFATop(
input clk,
input UART_RXD,
output UART_TXD
);

wire isrx;   // Uart sees something!
wire [7:0] rx_byte;  // Uart data
reg [7:0] tx_byte; // byte to transmit
 
always @(posedge clk) begin
   if (isrx)    // if you got something
        begin
            // data is rx_byte
            if (r_willWrite == 1)
                r_willWrite = 0;
            r_var_selector <= rx_byte[2:0];
            r_data <= rx_byte[7:3];
            if (r_var_selector == 0)
                r_new_index = r_data;
            if (r_var_selector == 1)
                r_new_value = r_data;
            if (r_var_selector == 2)
                r_queried_handle = r_data;
            if (r_var_selector == 3)
                r_isHandle = r_data;
            if (r_var_selector == 4)
                r_selector = r_data;
                r_willWrite = 1;
                tx_byte[0:0] <= resultBool;
                tx_byte[7:1] <= resultValue; 
        end
end

reg r_willWrite = 0;
reg r_var_selector;
reg r_data;
reg r_new_index;
reg r_new_value;
reg r_queried_handle;
reg r_isHandle;
reg r_selector;

wire willWrite;

wire new_index;
wire new_value;
wire queried_handle;
wire isHandle;
wire selector;
wire resultBool;
wire resultValue;

assign willWrite = r_willWrite;
assign new_index = r_new_index;
assign new_value = r_new_value;
assign queried_handle = r_queried_handle;
assign isHandle = r_isHandle;
assign selector = r_selector;

assign willWrite = r_willWrite;

ESFADesign(clk, willWrite, new_index, new_value, queried_handle, isHandle, resultBool, resultValue, selector);

UART #(
.baud_rate(9600), // default is 9600
.sys_clk_freq(12000000) // default is 100000000
)
UART0(
.clk(clk), // The master clock for this module
.rst(~nrst), // Synchronous reset
.rx(UART_RXD), // Incoming serial line
.tx(UART_TXD), // Outgoing serial line
.transmit(), // Signal to transmit
.tx_byte(), // Byte to transmit
.received(isrx), // Indicated that a byte has been received
.rx_byte(rx_byte), // Byte received
.is_receiving(), // Low when receive line is idle
.is_transmitting(),// Low when transmit line is idle
.recv_error() // Indicates error in receiving packet.
);

endmodule
