`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/31/2021 11:42:32 PM
// Design Name: 
// Module Name: block_trial_top_sim
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


module block_trial_top_sim;


    reg[0:0] clk = 0;
    always begin
        clk = 1; #14;
        clk = 0; #14;
    end
    
    reg[0:0] r_true = 1;
    wire is_true;
    assign is_true = r_true;
 
    assert a0(.clk(clk), .test(is_true));

    
    block_trial_top bt_top(
        .clk(clk)
    );
    
    
    initial
    begin
        // update Basic test
        $display("block trial sim, begin");
        #280000;
        r_true = (! bt_top.uart.uart_busy);
        #28;
    end

endmodule
