`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2021 06:48:28 PM
// Design Name: 
// Module Name: esfa_test
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


module block_trial_sim;

    reg[0:0] clk = 0;
    always begin
        clk = 1; #14;
        clk = 0; #14;
    end
    
    reg[0:0] r_true = 1;
    wire is_true;
    assign is_true = r_true;
 
    assert a0(.clk(clk), .test(is_true));
    
    wire[7:0] uart_result;
    
    block_trial bt(
        .clk(clk),
        .returnValue(uart_result)
    );
    
    wire[7:0] expectedReturn;
    assign expectedReturn = 'h1E;
    
    initial
    begin
        // update Basic test
        $display("block trial sim, begin");
        #420;
        r_true = (uart_result == expectedReturn);
        #168;

    end
   
    
endmodule
