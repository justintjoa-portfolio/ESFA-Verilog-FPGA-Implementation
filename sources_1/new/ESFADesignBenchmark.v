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


module ESFADesignBenchmark(
        input[0:0] clk,
        input[0:0] reset, 
        input[0:0] doRun,
        output reg[0:0] isRunning,
        output reg[0:0] wasSuccessful
    );
    
  //ESFA specific wires
  wire[7:0] new_index = romVal[15:8];
  wire[7:0] new_value = romVal[23:16];
  wire[7:0] metadata = romVal[31:24];
  wire[0:0] isMetadata = romVal[3:3];
  wire[7:0] selector = romVal[39:32];
  wire[0:0] resultBool;
  wire[7:0] resultValue;
  
  //BROM interface
  blk_mem_gen_0 blockROM();
  wire[39:0] romVal;
  reg[31:0] address;
  wire[0:0] isMutating = romVal[0:0];
  wire[0:0] expectedResultBool = romVal[1:1];
  wire[0:0] endOfProgram = romVal[2:2];
  ESFADesign l1(
    .clk(clk),
    .reset(reset),
    .new_index(new_index),
    .new_value(new_value),
    .metadata(metadata),
    .isMetadata(isMetadata),
    .selector(selector),
    .resultBool(resultBool),
    .resultValue(resultValue)
    );
   
  
  always @ (posedge clk)
  begin
        if (reset == 0) begin   
            numberClockCycles = 0;
            isRunning = 1'b0;
            wasSuccessful = 1'b1;
            selector <= 8;
        end else begin  
            if (doRun) begin  
                isRunning <= 1;
            end else begin    
                if (endOfProgram) begin   
                    isRunning <= 0;
                end else begin     
                    if (isRunning) begin     
                        if (!isMutating) begin   
                            if (resultBool != expectedResultBool) begin     
                                isRunning <= 0;  
                                wasSuccessful <= 0;
                            end
                        end 
                        address <= address + 1;
                    end
                end
            end
        end
  end
    
    
    
endmodule
