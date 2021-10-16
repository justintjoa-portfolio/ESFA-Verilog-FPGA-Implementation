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
        inout[0:0] setBit,
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
        
        output out_arrDef,
        output out_handle,
        output out_array_code,
        output out_eltDef,
        output out_rank,
        output out_low,
        output out_high,
        output out_index,
        output out_value,
        output out_mark
    );
    
    reg r_didWrite = 1'b0;
    reg r_arrDef;
    reg r_handle;
    reg r_array_code;
    reg r_eltDef;
    reg r_rank;
    reg r_low;
    reg r_high;
    reg r_index;
    reg r_value;
    reg r_mark;
    
    assign out_arrDef = r_arrDef;
    assign out_handle = r_handle;
    assign out_array_code = r_array_code;
    assign out_eltDef = r_eltDef;
    assign out_rank = r_rank;
    assign out_low = r_low;
    assign out_high = r_high;
    assign out_index = r_index;
    assign out_value = r_value;
    assign out_mark = r_mark;
    assign setBit = ! r_didWrite && setBit;
    
    always @ (posedge clk)
        if (willSet) begin
            didWrite <= 1'b0;
            r_arrDef <= arr_def;    
            r_handle <= handle;        
            r_array_code <= array_code;
            r_eltDef <= eltDef;
            r_rank <= rank;
            r_low <= low;
            r_high <= high;
            r_index <= index;
            r_value <= value;
            r_mark <= mark;
            didWRite <= 1'b1;
        end
            
    
    
endmodule
