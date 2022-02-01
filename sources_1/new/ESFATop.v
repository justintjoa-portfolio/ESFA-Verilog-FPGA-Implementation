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
    
  reg[0:0] isRunning_next;
  reg[0:0] wasSuccessful_next;  
  reg[0:0] didRun;
  reg[0:0] didRun_next;
  
  reg[31:0] address;
  reg[31:0] address_next;
  reg[0:0] doIncrement;
  reg[0:0] doIncrement_next;
    
  wire[63:0] romVal;
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
            isRunning <= 1'b0;
            wasSuccessful <= 1'b1;
            address <= 0;
            didRun <= 0;
            doIncrement <= 0;
        end else begin  
            isRunning <= isRunning_next;
            wasSuccessful <= wasSuccessful_next;
            didRun <= didRun_next;
            address <= address_next; 
            doIncrement <= doIncrement_next;
        end
  end
  
  always @(*) begin 
        isRunning_next = isRunning;
        wasSuccessful_next = wasSuccessful;
        didRun_next = didRun;
        address_next = address;
        doIncrement_next = doIncrement;
        if (doRun && ! didRun_next) begin  
            isRunning_next = 1;
        end 
        if (isRunning_next) begin  
            if (endOfProgram) begin   
               isRunning_next = 0;
               didRun_next = 1'b1;
            end else begin       
               if (!isMutating) begin   
                   if (resultBool != expectedResultBool || resultValue != expectedResultValue) begin     
                         isRunning_next = 0;  
                         didRun_next = 1'b1;
                         wasSuccessful_next = 0;
                    end
               end 
            end
         end
         if (isRunning_next) begin    
            if (doIncrement_next) begin 
                address_next = address_next + 8;
                doIncrement_next = 0;
            end else begin 
                doIncrement_next = 1;
            end
         end
  end
    
    
    
endmodule
