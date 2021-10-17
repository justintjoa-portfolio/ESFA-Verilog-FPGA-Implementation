`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2021 12:40:45 PM
// Design Name: 
// Module Name: MemoryCellTupleRegs
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

//Implement latch for this! this will lock itself out

module MemoryCellTupleRegs(
        input[0:0] setBit,
        input arrDef,
        input handle,
        input array_code,
        input eltDef,
        input rank,
        input low,
        input high,
        input index,
        input value,
        input mark,
        
        output reg out_arrDef,
        output reg out_handle,
        output reg out_array_code,
        output reg out_eltDef,
        output reg out_rank,
        output reg out_low,
        output reg out_high,
        output reg out_index,
        output reg out_value,
        output reg out_mark
    );
        
    always @ (posedge clk)
        if (setBit) begin
            out_arrDef <= arr_def;    
            out_handle <= handle;        
            out_array_code <= array_code;
            out_eltDef <= eltDef;
            out_rank <= rank;
            out_low <= low;
            out_high <= high;
            out_index <= index;
            out_value <= value;
            out_mark <= mark;
        end
            
    
    
endmodule
