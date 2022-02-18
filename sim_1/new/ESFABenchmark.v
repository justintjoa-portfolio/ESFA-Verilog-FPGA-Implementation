`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/26/2022 02:54:03 PM
// Design Name: 
// Module Name: ESFABenchmark
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


module ESFABenchmark(
        
    );
    
    reg[0:0] clk = 0;
    
    always begin
        clk = 1; #14;
        clk = 0; #14;
    end
    
    reg[0:0] reset = 1'b0;
 
    reg[0:0] r_true = 1;
    wire is_true;
    assign is_true = r_true;
 
    assert a0(.clk(clk), .test(is_true));
    
    wire[0:0] wasSuccessful;
    reg[0:0] doRun = 1'b0;
    wire[0:0] isRunning;
    
    ESFATop top(
        .clk(clk),
        .reset(reset), 
        .doRun(doRun),
        .isRunning(isRunning),
        .wasSuccessful(wasSuccessful)
      );
    
        initial begin   
            // update Basic test
            $display("benchmark sim");
            #420; //wait for reset to complete
            reset = 1'b1;
            $display("assertions working correctly");
            doRun = 1'b1;
            #4200;
            #28;
            #28;
            #28;
            #28;
            #28;
            #28;
            #28;
            #28;
            #28;
            #28;
            #28;
            #28;
            #560000;
            #560000;
            doRun = 1'b0;
            
        end
    
endmodule
