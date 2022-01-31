`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/26/2022 12:40:04 PM
// Design Name: 
// Module Name: ESFADesignBenchmark
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
        input[0:0] clk,
        input[0:0] reset, 
        input[0:0] doRun,
        output reg[0:0] isRunning,
        output reg[0:0] wasSuccessful
    );
    
  wire[63:0] romVal;
  reg[31:0] address;
  wire[0:0] isMutating;
  assign isMutating = romVal[0:0];
  wire[0:0] expectedResultBool;
  assign expectedResultBool = romVal[1:1];
  wire[0:0] endOfProgram;
  assign endOfProgram = romVal[2:2];
  wire[7:0] expectedResultValue;
  assign expectedResultValue = romVal[47:40];  
    
    
  //ESFA specific wires
  wire[7:0] queried_handle;
  assign queried_handle = romVal[15:8];
  wire[7:0] new_index;
  assign new_index = romVal[23:16];
  wire[7:0] new_value;
  assign new_value = romVal[31:24];
  wire[7:0] selector;
  assign selector = romVal[39:32];
  wire[0:0] resultBool;
  wire[7:0] resultValue;
  
  //controls
  reg[0:0] didRun;
  reg[0:0] doIncrement;
  
  
  //BROM interface
  blk_mem_gen_0 blockROM(
    .clka(clk),
    .rsta(! reset), //reset acts on 1 
    .addra(address), 
    .douta(romVal),
    .rsta_busy()
  );
  
  ESFADesign l1(
    .clk(clk),
    .reset(reset),
    .queried_handle(queried_handle),
    .new_index(new_index),
    .new_value(new_value),
    .selector(selector),
    .resultBool(resultBool),
    .resultValue(resultValue)
    );
   
  
  always @ (posedge clk)
  begin
        if (reset == 0) begin   
            isRunning = 1'b0;
            wasSuccessful = 1'b1;
            address <= 0;
            didRun <= 0;
            doIncrement <= 0;
        end else begin  
            if (doRun && ! didRun) begin  
                isRunning <= 1;
            end 
            if (isRunning) begin  
                 if (endOfProgram) begin   
                    isRunning <= 0;
                    didRun <= 1'b1;
                end else begin     
                    if (isRunning) begin     
                        if (!isMutating) begin   
                            if (resultBool != expectedResultBool && resultValue != expectedResultValue) begin     
                                isRunning <= 0;  
                                didRun <= 1'b1;
                                wasSuccessful <= 0;
                            end
                        end 
                        if (doIncrement == 0) begin 
                            doIncrement <= 1;
                        end else begin 
                            address <= address + 8; // indexed by width of word in bytes
                            //latency of data is 2 cycles
                            doIncrement <= 0;
                        end
                    end
                end
            end
        end
  end
    
    
    
endmodule
