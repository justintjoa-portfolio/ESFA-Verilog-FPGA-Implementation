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
    
    reg[0:0] reset = 1'b1;
 
    reg[0:0] r_true = 1;
    wire is_true;
    assign is_true = r_true;
 
    assert a0(.clk(clk), .test(is_true));
    
    wire[0:0] wasSuccessful;
    reg[0:0] doRun = 1'b0;
    wire[0:0] isRunning;
    wire[7:0] instructionOfError;
    wire[0:0] didRun;
    
    ESFATop top(
        .clk(clk),
        .reset(reset), 
        .doRun(doRun),
        .isRunning(isRunning),
        .wasSuccessful(wasSuccessful),
        .instructionOfError(instructionOfError), 
        .didRun(didRun)
      );
    
    task syncreset;
    begin  
        reset = 1'b0;
        doRun = 1'b0;
        #84;
        reset = 1'b1;
        #56000;
    end
    endtask
    
    
        initial begin   
            // update Basic test
            $display("benchmark sim");
            syncreset();
            doRun = 1'b1;
            #56000;
            $display("running benchmark sim again");
            syncreset();
            doRun = 1'b1;
            #560000;
            #560000;
            
        end
    
endmodule
