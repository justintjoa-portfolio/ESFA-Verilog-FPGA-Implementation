`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2021 11:08:08 PM
// Design Name: 
// Module Name: operationChooser
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


module operationChooser(
        input new_index,
        input new_value,
        input new_handle,
        input a_isHandle,
        input metadata,
        input isMetadata,
        input selector,
        output resultBool,
        output resultValue
    );
    
    MemoryCellTupleRegs regs;
    updateDesign updater;
   lookUpScan lookScan;
   lookupFinalizer lookFinalizer;
   encode encoder;
   deleteDesign deleter;
   congrueUpDesign upEqualizer;
    congrueDownDesign downEqualizer; 
endmodule
