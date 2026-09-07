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
        input wire clk,
        input wire reset, 
        EsfaTopIO.io io
    );
    
  logic [31:0] address;
  logic doIncrement;

  logic isRunning_next;
  logic wasSuccessful_next;  
  logic didRun_next;
  logic [7:0] instructionOfError_next;
  logic [31:0] address_next;
  logic doIncrement_next;

  wire[63:0] romVal;
  wire[0:0] isMutating;
  assign isMutating = romVal[0:0];
  wire[0:0] expectedResultBool;
  assign expectedResultBool = romVal[1:1];
  wire[0:0] endOfProgram;
  assign endOfProgram = romVal[2:2];
  wire[7:0] expectedResultValue;
  assign expectedResultValue = romVal[47:40];  
  wire[7:0] instructionID;
  assign instructionID = romVal[55:48];
    

  //ESFA specific wires
  EsfaDesignIO esfa_design_io();
  assign esfa_design_io.queried_handle = romVal[15:8];
  assign esfa_design_io.new_index = romVal[23:16];
  assign esfa_design_io.new_value = romVal[31:24];
  assign esfa_design_io.selector = romVal[39:32];

  wire[0:0] resetBusy;
  
  //BROM interface
  blk_mem_gen_0 blockROM(
    .clka(clk),
    .rsta(! reset), //reset acts on 1 
    .addra(address), 
    .douta(romVal),
    .rsta_busy(resetBusy)
  );

  ESFADesign l1(
    .clk(clk),
    .reset(reset),
    .esfa_design_io(esfa_design_io)
  );
   
  
  logic doRun_synced;
  
  always @ (posedge clk)
  begin
        if (reset == 0) begin   
            isRunning <= 1'b0;
            wasSuccessful <= 1'b1;
            address <= 0;
            didRun <= 0;
            doIncrement <= 0;
            instructionOfError <= 0;
            doRun_synced <= 1'b0;
        end else begin  
            isRunning <= isRunning_next;
            wasSuccessful <= wasSuccessful_next;
            didRun <= didRun_next;
            address <= address_next; 
            doIncrement <= doIncrement_next;
            instructionOfError <= instructionOfError_next;
            doRun_synced <= doRun;
        end
  end
  
  always @(*) begin 
        isRunning_next = isRunning;
        wasSuccessful_next = wasSuccessful;
        didRun_next = didRun;
        address_next = address;
        doIncrement_next = doIncrement;
        instructionOfError_next = instructionOfError;
        if (endOfProgram) begin   
            isRunning_next = 0;
            didRun_next = 1'b1;
        end else begin   
            if (! isRunning_next && doRun_synced && ! didRun_next && ! resetBusy && address == 0 && instructionID == 0) begin  
                isRunning_next = 1;
            end 
            if (isRunning_next) begin  
                if (!isMutating) begin   
                   if ((expectedResultBool && (! esfa_design_io.resultBool || resultValue != expectedResultValue)) || (! expectedResultBool && resultBool)) begin     
                         isRunning_next = 0;  
                         didRun_next = 1'b1;
                         wasSuccessful_next = 0;
                         instructionOfError_next = instructionID;
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
  end
    
    
    
endmodule
