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
        input logic clk,
        input logic[0:0] reset_n, 
        input logic[0:0] doRun,
        output logic isRunning,
        output logic wasSuccessful,
        output logic[7:0] instructionOfError,
        output logic didRun
    );

    typedef struct packed {
        logic [7:0] reserved_byte;           // romVal[63:56]
        logic [7:0] instruction_id;          // romVal[55:48]
        logic [7:0] expected_result_value;   // romVal[47:40]
        logic [7:0] selector;                // romVal[39:32]
        logic [7:0] new_value;               // romVal[31:24]
        logic [7:0] new_index;               // romVal[23:16]
        logic [7:0] queried_handle;          // romVal[15:8]
        logic [4:0] reserved_flags;          // romVal[7:3]
        logic       end_of_program;          // romVal[2]
        logic       expected_result_bool;    // romVal[1]
        logic       is_mutating;             // romVal[0]
    } EsfaRomInstruction;

  // Word addressed, not byte addressed.
  logic[7:0] address;
  logic doIncrement;

  logic isRunning_next;
  logic wasSuccessful_next;  
  logic didRun_next;
  logic[7:0] instructionOfError_next;
  logic[7:0] address_next;
  logic doIncrement_next;

    
  logic [63:0] romVal;
  EsfaRomInstruction instruction;

  assign instruction = romVal;
    
    
  //ESFA specific wires
  EsfaDesignIO esfa_design_io();
  assign esfa_design_io.queried_handle = instruction.queried_handle;
  assign esfa_design_io.new_index = instruction.new_index;
  assign esfa_design_io.new_value = instruction.new_value;
  assign esfa_design_io.selector = instruction.selector;

  logic [0:0] resetBusy;
  
  //BROM interface
  blk_mem_gen_0 blockROM(
    .clka(clk),
    .rsta(! reset_n), //reset acts on 1 
    .addra(address), 
    .douta(romVal),
    .rsta_busy(resetBusy)
  );
  
  ESFADesign l1(
    .clk(clk),
    .reset_n(reset_n),
    .esfa_design_io(esfa_design_io)
  );
   
  
  logic doRun_synced;
  
  always @ (posedge clk)
  begin
        if (reset_n == 0) begin   
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
        if (instruction.end_of_program) begin   
            isRunning_next = 0;
            didRun_next = 1'b1;
        end else begin   
            if (! isRunning_next && doRun_synced && ! didRun_next && ! resetBusy && address == 0 && instruction.instruction_id == 0) begin  
                isRunning_next = 1;
            end 
            if (isRunning_next) begin  
                if (!instruction.is_mutating) begin   
                   if ((instruction.expected_result_bool && (! esfa_design_io.resultBool || esfa_design_io.resultValue != instruction.expected_result_value)) || (! instruction.expected_result_bool && esfa_design_io.resultBool)) begin     
                         isRunning_next = 0;  
                         didRun_next = 1'b1;
                         wasSuccessful_next = 0;
                         instructionOfError_next = instruction.instruction_id;
                    end
                end 
             end
             if (isRunning_next) begin    
                if (doIncrement_next) begin 
                    address_next = address_next + 1;
                    doIncrement_next = 0;
                end else begin 
                    doIncrement_next = 1;
                end
            end
         end
  end
    
    
    
endmodule