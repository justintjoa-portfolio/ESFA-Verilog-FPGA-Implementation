`timescale 1ns / 1ps
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
        input clk,
        input handle, 
        input inserted_index,
        input inserted_value,
        input queried_handle,
        input isHandle,
        input metadata,
        input isMetadata,
        input selector,
        output resultBool,
        output resultValue,
        output resultContext
    );

     wire in_clk;
     wire in_arrDef;
     wire in_array_code;
     wire in_eltDef;
     wire in_rank;
     wire in_low;  
     wire in_high;
     wire in_index;
     wire in_value;
     wire in_mark;
     
     reg new_arrDef;
     reg new_array_code;
     reg new_eltDef;
     reg new_rank;
     reg new_low;
     reg new_high;
     reg new_index;
     reg new_value;
     reg new_mark;
     reg new_bool;
     reg new_context;
     
     // Output of MemoryCellTupleRegs
     wire out_arrDef;
     wire out_handle;
     wire out_array_code;
     wire out_eltDef;
     wire out_rank;
     wire out_low;  
     wire out_high;
     wire out_index;
     wire out_value;
     wire out_mark;
     
    assign resultBool = new_bool;
    assign resultValue = new_value;
    assign resultContext = new_context;
    
    MemoryCellTupleRegs regs(in_clk, in_arrDef, handle, in_array_code, in_eltDef, in_rank, in_low, in_high, in_index, in_value, in_Mark, out_arrDef, out_handle,
    out_array_code, out_eltDef, out_rank, out_low, out_high, out_index, out_value, out_mark);
    
    // output wires for each combinator block
    wire a_resultBool, a_resultValue, a_resultContext, a_arrDef, a_array_code, a_eltDef, a_rank, a_low, a_high, a_index, a_value, a_mark;
    wire b_resultBool, b_resultValue, b_resultContext, b_arrDef, b_array_code, b_eltDef, b_rank, b_low, b_high, b_index, b_value, b_mark;
    wire c_resultBool, c_resultValue, c_resultContext, c_arrDef, c_array_code, c_eltDef, c_rank, c_low, c_high, c_index, c_value, c_mark;
    wire d_resultBool, d_resultValue, d_resultContext, d_arrDef, d_array_code, d_eltDef, d_rank, d_low, d_high, d_index, d_value, d_mark;
    wire e_resultBool, e_resultValue, e_resultContext, e_arrDef, e_array_code, e_eltDef, e_rank, e_low, e_high, e_index, e_value, e_mark;
    wire f_resultBool, f_resultValue, f_resultContext, f_arrDef, f_array_code, f_eltDef, f_rank, f_low, f_high, f_index, f_value, f_mark;
    wire g_resultBool, g_resultValue, g_resultContext, g_arrDef, g_array_code, g_eltDef, g_rank, g_low, g_high, g_index, g_value, g_mark;
    wire h_resultBool, h_resultValue, h_resultContext, h_arrDef, h_array_code, h_eltDef, h_rank, h_low, h_high, h_index, h_value, h_mark;
    
   updateDesign updater(out_arrDef, out_handle, out_array_code, out_eltDef, out_rank, out_low, out_high, out_index, out_value, out_mark, inserted_index, inserted_value, queried_handle, isHandle,
   metadata, isMetadata, a_resultBool, a_resultValue, a_resultContext, a_arrDef, a_array_code, a_eltDef, a_rank, a_low, a_high, a_index, a_value, a_mark);
   
   lookUpScan lookScan(out_arrDef, out_handle, out_array_code, out_eltDef, out_rank, out_low, out_high, out_index, out_value, out_mark, inserted_index, inserted_value, queried_handle, isHandle,
   metadata, isMetadata, b_resultBool, b_resultValue,  b_resultContext, b_arrDef, b_array_code, b_eltDef, b_rank, b_low, b_high, b_index, b_value, b_mark);
   
   lookUpFinalizer lookFinalizer(out_arrDef, out_handle, out_array_code, out_eltDef, out_rank, out_low, out_high, out_index, out_value, out_mark, inserted_index, inserted_value, queried_handle, isHandle,
   metadata, isMetadata, c_resultBool, c_resultValue, c_resultContext, c_arrDef, c_array_code, c_eltDef, c_rank, c_low, c_high, c_index, c_value, c_mark);
   
   encode encoder(out_arrDef, out_handle, out_array_code, out_eltDef, out_rank, out_low, out_high, out_index, out_value, out_mark, inserted_index, inserted_value, queried_handle, isHandle,
   metadata, isMetadata, d_resultBool, d_resultValue,  d_resultContext, d_arrDef, d_array_code, d_eltDef, d_rank, d_low, d_high, d_index, d_value, d_mark);
   
   deleteDesign deleter(out_arrDef, out_handle, out_array_code, out_eltDef, out_rank, out_low, out_high, out_index, out_value, out_mark, inserted_index, inserted_value, queried_handle, isHandle,
   metadata, isMetadata, e_resultBool, e_resultValue,  e_resultContext, e_arrDef, e_array_code, e_eltDef, e_rank, e_low, e_high, e_index, e_value, e_mark);
   
   congrueUpDesign upEqualizer(out_arrDef, out_handle, out_array_code, out_eltDef, out_rank, out_low, out_high, out_index, out_value, out_mark, inserted_index, inserted_value, queried_handle, isHandle,
   metadata, isMetadata, f_resultBool, f_resultValue, f_resultContext, f_arrDef, f_array_code, f_eltDef, f_rank, f_low, f_high, f_index, f_value, f_mark);
   
   congrueDownDesign downEqualizer(out_arrDef, out_handle, out_array_code, out_eltDef, out_rank, out_low, out_high, out_index, out_value, out_mark, inserted_index, inserted_value, queried_handle, isHandle,
   metadata, isMetadata, g_resultBool, g_resultValue,  g_resultContext, g_arrDef, g_array_code, g_eltDef, g_rank, g_low, g_high, g_index, g_value, g_mark);
   
   markAvailableCell vacantCellMarker(out_arrDef, out_handle, out_array_code, out_eltDef, out_rank, out_low, out_high, out_index, out_value, out_mark, inserted_index, inserted_value, queried_handle, isHandle,
   metadata, isMetadata, h_resultBool, h_resultValue, h_resultContext, h_arrDef, h_array_code, h_eltDef, h_rank, h_low, h_high, h_index, h_value, h_mark);
    
    
    assign in_arrDef = new_arrDef;
     assign in_array_code = new_array_code;
     assign in_eltDef = new_eltDef;
     assign in_rank = new_rank;
     assign in_low = new_low;
     assign in_high = new_high;
     assign in_index = new_index;
     assign in_value = new_value;
     assign in_mark = new_mark;
    
    
    //Map
    // 0 : update  
    // 1 : lookUpScan    
    // 2 : lookUpFinalizer   
    // 3: encode      
    // 4: delete   
    // 5: congrueUp  
    // 6: congruedown 
    // 7: markAvailableCell    
    
    always @ (posedge clk)
        begin
            if (selector == 0)
                new_arrDef = a_arrDef;
                new_array_code = a_array_code;
                new_eltDef = a_eltDef;
                new_rank = a_rank;
                new_low = a_low;
                new_high = a_high;
                new_index = a_index;
                new_value = a_value;
                new_mark = a_mark;
                
                new_bool = a_resultBool;
                new_value = a_resultValue;
                new_context = a_resultContext;
            if (selector == 1)
                new_arrDef = b_arrDef;
                new_array_code = b_array_code;
                new_eltDef = b_eltDef;
                new_rank = b_rank;
                new_low = b_low;
                new_high = b_high;
                new_index = b_index;
                new_value = b_value;
                new_mark = b_mark;
                
                new_bool = b_resultBool;
                new_value = b_resultValue;
                new_context = b_resultContext;
            if (selector == 2)
                new_arrDef = c_arrDef;
                new_array_code = c_array_code;
                new_eltDef = c_eltDef;
                new_rank = c_rank;
                new_low = c_low;
                new_high = c_high;
                new_index = c_index;
                new_value = c_value;
                new_mark = c_mark;
                
                new_bool = c_resultBool;
                new_value = c_resultValue;
                new_context = c_resultContext;
            if (selector == 3)
                new_arrDef = d_arrDef;
                new_array_code = d_array_code;
                new_eltDef = d_eltDef;
                new_rank = d_rank;
                new_low = d_low;
                new_high = d_high;
                new_index = d_index;
                new_value = d_value;
                new_mark = d_mark;
                
                new_bool = d_resultBool;
                new_value = d_resultValue;
                new_context = d_resultContext;
            if (selector == 4)
                new_arrDef = e_arrDef;
                new_array_code = e_array_code;
                new_eltDef = e_eltDef;
                new_rank = e_rank;
                new_low = e_low;
                new_high = e_high;
                new_index = e_index;
                new_value = e_value;
                new_mark = e_mark;
                
                new_bool = e_resultBool;
                new_value = e_resultValue;
                new_context = e_resultContext;
            if (selector == 5)
                new_arrDef = f_arrDef;
                new_array_code = f_array_code;
                new_eltDef = f_eltDef;
                new_rank = f_rank;
                new_low = f_low;
                new_high = f_high;
                new_index = f_index;
                new_value = f_value;
                new_mark = f_mark;
                
                new_bool = f_resultBool;
                new_value = f_resultValue;
                new_context = f_resultContext;
            if (selector == 6)   
                new_arrDef = g_arrDef;
                new_array_code = g_array_code;
                new_eltDef = g_eltDef;
                new_rank = g_rank;
                new_low = g_low;
                new_high = g_high;
                new_index = g_index;
                new_value = g_value;
                new_mark = g_mark;  
                
                new_bool = g_resultBool;
                new_value = g_resultValue; 
                new_context = g_resultContext;     
            if (selector == 7)
                new_arrDef = h_arrDef;
                new_array_code = h_array_code;
                new_eltDef = h_eltDef;
                new_rank = h_rank;
                new_low = h_low;
                new_high = h_high;
                new_index = h_index;
                new_value = h_value;
                new_mark = h_mark;  
                
                new_bool = h_resultBool;
                new_value = h_resultValue; 
                new_context = h_resultContext;   
        end
endmodule


