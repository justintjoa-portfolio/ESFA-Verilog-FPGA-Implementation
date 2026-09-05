`timescale 1ns / 1ps
`include "ESFAOperations.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2021 12:48:37 PM
// Design Name: 
// Module Name: MemoryCell
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


module MemoryCell(
        input logic clk, 
        input logic reset,
        MemoryCellInput.in input_signals,
        CombinatorIO.out result_signals
    );
     
    // Internal state 
    logic [0:0] arrDef;
    logic [7:0] array_code; 
    logic [0:0] eltDef;
    logic [7:0] rank;
    logic [7:0] low;
    logic [7:0] high;
    logic [7:0] index;
    logic [7:0] value;
    logic [7:0] prev_selector;

    // Internal state next vals 
    logic [0:0] arrDef_next;
    logic [7:0] array_code_next;
    logic [0:0] eltDef_next;
    logic [7:0] rank_next;
    logic [7:0] low_next;
    logic [7:0] high_next;
    logic [7:0] index_next;
    logic [7:0] value_next;
    logic [7:0] prev_selector_next;

    // Next output signals
    CombinatorIO result_signals_next();
     
     
    always_ff @(posedge clk)
        begin
                if (reset == 1'b0) begin
                    arrDef <= 1'b0;
                    array_code <= 0;
                    eltDef <= 1'b0;
                    rank <= 0;
                    low <= 0;
                    high <= 0;
                    index <= 0;
                    value <= 0;
                    
                    result_signals.value <= 8'b0;
                    result_signals.valid <= 1'b0;  
                    result_signals.metadata <= 8'b0;
                    prev_selector <= 8'b1000;
                end else begin  
                      arrDef <= arrDef_next;
                      array_code <= array_code_next;
                      eltDef <= eltDef_next;
                      rank <= rank_next;
                      low <= low_next;
                      high <= high_next;
                      index <= index_next;
                      value <= value_next; 
                      result_signals.valid <= result_signals_next.valid;
                      result_signals.value <= result_signals_next.value;
                      result_signals.metadata <= result_signals_next.metadata;
                      prev_selector <= prev_selector_next;
               end
    end
                
    
    
    
    always_comb begin
               arrDef_next = arrDef;
               array_code_next = array_code;
               eltDef_next = eltDef;
               low_next = low;
               high_next = high;
               value_next = value;
               index_next = index;
               rank_next = rank;
               result_signals_next.valid = result_signals.valid;
               result_signals_next.value = result_signals.value;
               result_signals_next.metadata = result_signals.metadata;
               prev_selector_next = input_signals.selector; 
               if (input_signals.selector != prev_selector) begin  
                    case (input_signals.selector)
                        `ESFA_UPDATE: begin
                            result_signals_next.valid = (input_signals.available_handle == input_signals.handle && input_signals.is_available_handle);
                   
                            if (result_signals_next.valid) begin  
                                arrDef_next = 1'b1;
                                array_code_next = input_signals.handle;
                                eltDef_next = 1'b1;
                                low_next = input_signals.handle;
                                high_next = input_signals.handle;
                                value_next = input_signals.inserted_value;
                                index_next = input_signals.inserted_index;
                                rank_next = 1;
                            end   
                            result_signals_next.value = input_signals.handle;
                            result_signals_next.metadata = input_signals.handle;
                        end
                        
                        `ESFA_LOOKUP_SCAN: begin
                            result_signals_next.valid = (input_signals.inserted_index == index_next) && input_signals.is_given_code && (input_signals.given_code >= low_next) && (input_signals.given_code <= high_next);
                            result_signals_next.value = value_next;
                            result_signals_next.metadata = rank_next;
                        
                        end
                   
                        `ESFA_ENCODE: begin
                            result_signals_next.valid = (!(input_signals.queried_handle > 7)) && (arrDef_next) && (input_signals.queried_handle  == input_signals.handle);
                            result_signals_next.value = array_code_next;
                            result_signals_next.metadata = array_code_next;
                        end
                        
                        `ESFA_CONGRUE_UP: begin
                            if (input_signals.is_given_code && input_signals.is_given_rank) begin 
                                if (input_signals.available_handle == input_signals.handle && input_signals.is_available_handle) begin  
                                    result_signals_next.valid = 1'b1; // allows so that output of this is equivalent to preceding op, update 
                                    array_code_next = input_signals.given_code + 1;
                                    high_next = input_signals.given_code + 1;
                                    low_next = input_signals.given_code + 1;
                                    rank_next = input_signals.given_rank + 1;
                                end else begin     
                                    if (array_code_next > input_signals.given_code && arrDef_next) begin 
                                        array_code_next = array_code_next + 1;
                                    end
                                    if (eltDef_next) begin 
                                        if (low_next > input_signals.given_code) begin 
                                            low_next = low_next + 1;
                                        end
                                        if (high_next >= input_signals.given_code) begin 
                                            high_next = high_next + 1;
                                        end
                                    end
                                end
                            end
                        end
                        
                        `ESFA_CONGRUE_DOWN: begin
                            if (input_signals.is_given_code) begin  
                                result_signals_next.valid = 1'b1;
                                if (input_signals.queried_handle == input_signals.handle) begin    
                                    arrDef_next = 1'b0;
                                    rank_next = 0;
                                end
                           
                                if (eltDef_next && input_signals.given_code < low_next) begin  
                                    high_next = high_next - 1;
                                    low_next = low_next - 1;
                                end else begin   
                                    if (eltDef_next && (low_next <= input_signals.given_code && input_signals.given_code <= high_next)) begin 
                                        high_next = high_next - 1;
                                    end
                                end
                                if (eltDef_next && low_next > high_next) begin 
                                    eltDef_next = 1'b0;
                                    arrDef_next = 1'b0;
                                end
                                if (arrDef_next && array_code_next > input_signals.given_code) begin 
                                    array_code_next = array_code_next - 1;
                                end
    
                            end
                        end
                    
                        `ESFA_FIND_AVAILABLE_CELL: begin
                            result_signals_next.valid = ! eltDef_next;
                            result_signals_next.value = input_signals.handle;
                            result_signals_next.metadata = input_signals.handle;
                        end
    
                        `ESFA_ENRANK: begin   
                            result_signals_next.valid = (!(input_signals.queried_handle > 7)) && (arrDef_next) && (input_signals.queried_handle == input_signals.handle);
                            result_signals_next.value = rank_next;
                            result_signals_next.metadata = rank_next;
                        end
                        
                        `ESFA_DEBUG_SINGLE_CELL_CONGRUE_UP: begin
                            if (input_signals.queried_handle == input_signals.handle) begin    
                                if (input_signals.is_given_code && input_signals.is_given_rank) begin 
                                    result_signals_next.valid = 1'b1;
                                    if (input_signals.available_handle == input_signals.handle && input_signals.is_available_handle) begin   
                                        array_code_next = input_signals.given_code + 1;
                                        high_next = input_signals.given_code + 1;
                                        low_next = input_signals.given_code + 1;
                                        rank_next = input_signals.given_rank + 1;
                                    end else begin     
                                        if (array_code_next > input_signals.given_code && arrDef_next) begin 
                                            array_code_next = array_code_next + 1;
                                        end
                                        if (eltDef_next) begin 
                                            if (low_next > input_signals.given_code) begin 
                                                low_next = low_next + 1;
                                            end
                                            if (high_next >= input_signals.given_code) begin 
                                                high_next = high_next + 1;
                                            end
                                        end
                                    end
                                end
                            end
                        end           
                        
                        `ESFA_NO_OP: begin 
                            // no op selector 
                        end         
                endcase
               end 
           end

            
            
  
endmodule




