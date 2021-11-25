`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2021 08:53:11 PM
// Design Name: 
// Module Name: ESFADesign
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


module ESFADesign(
    input[0:0] clk, 
    input[0:0] in_willWrite,
    input[7:0] new_index,
    input[7:0] new_value,
    input[7:0] queried_handle,
    input[0:0] isHandle,
    output[0:0] resultBool,
    output[7:0] resultValue,
    input[7:0] selector
    );
    
    wire[0:0] willWrite;
    assign willWrite = in_willWrite && !reset;
    
    wire[7:0] c0Handle;
    assign c0Handle = 0;
    wire[7:0] c0Result;
    wire[7:0] c0Context;
    wire[0:0] c0Bool;
    
    wire[7:0] c1Handle;
    assign c1Handle = 1;
    wire[7:0] c1Result;
    wire[7:0] c1Context;
    wire[0:0] c1Bool;
    
    wire[7:0] c2Handle;
    assign c2Handle = 2;
    wire[7:0] c2Result;
    wire[7:0] c2Context;
    wire[0:0] c2Bool;
    
    wire[7:0] c3Handle;
    assign c3Handle = 3;
    wire[7:0] c3Result;
    wire[7:0] c3Context;
    wire[0:0] c3Bool;
    
    wire[7:0] c4Handle;
    assign c4Handle = 4;
    wire[7:0] c4Result;
    wire[7:0] c4Context;
    wire[0:0] c4Bool;
    
    wire[7:0] c5Handle;
    assign c5Handle = 5;
    wire[7:0] c5Result;
    wire[7:0] c5Context;
    wire[0:0] c5Bool;
    
    wire[7:0] c6Handle;
    assign c6Handle = 6;
    wire[7:0] c6Result;
    wire[7:0] c6Context;
    wire[0:0] c6Bool;
    
    wire[7:0] c7Handle;
    assign c7Handle = 7;
    wire[7:0] c7Result;
    wire[7:0] c7Context;
    wire[0:0] c7Bool;
    
    wire combinator1Result;
    wire combinator1Context;
    wire combinator1Bool;
    
    wire combinator2Result;
    wire combinator2Context;
    wire combinator2Bool;
    
    wire combinator3Result;
    wire combinator3Context;
    wire combinator3Bool;
    
    wire combinator4Result;
    wire combinator4Context;
    wire combinator4Bool;
    
    wire combinator5Result;
    wire combinator5Context;
    wire combinator5Bool;
    
    wire combinator6Result;
    wire combinator6Context;
    wire combinator6Bool;
    
    wire combinator7Context;
    
    reg[7:0] in_metadata = 0;
    reg[7:0] in_isMetadata = 0;
    
    reg[0:0] reset = 1;

   
    
    MemoryCell c0(clk, willWrite, c0Handle, new_index, new_value, queried_handle, isHandle, in_metadata, in_isMetadata, selector, c0Bool, c0Result, c0Context);
    MemoryCell c1(clk, willWrite, c1Handle, new_index, new_value, queried_handle, isHandle, in_metadata, in_isMetadata,  selector, c1Bool, c1Result, c1Context);
    MemoryCell c2(clk, willWrite, c2Handle, new_index, new_value, queried_handle, isHandle, in_metadata, in_isMetadata, selector, c2Bool, c2Result, c2Context);
    MemoryCell c3(clk, willWrite, c3Handle, new_index, new_value, queried_handle, isHandle, in_metadata, in_isMetadata, selector, c3Bool, c3Result, c3Context);
    MemoryCell c4(clk, willWrite, c4Handle, new_index, new_value, queried_handle, isHandle, in_metadata, in_isMetadata, selector, c4Bool, c4Result, c4Context);
    MemoryCell c5(clk, willWrite, c5Handle, new_index, new_value, queried_handle, isHandle, in_metadata, in_isMetadata, selector, c5Bool, c5Result, c5Context);
    MemoryCell c6(clk, willWrite, c6Handle, new_index, new_value, queried_handle, isHandle, in_metadata, in_isMetadata, selector, c6Bool, c6Result, c6Context);
    MemoryCell c7(clk, willWrite, c7Handle, new_index, new_value, queried_handle, isHandle, in_metadata, in_isMetadata, selector, c7Bool, c7Result, c7Context);
    
    NodeCombinator combinator1(clk, selector, c0Result, c0Context, c0Bool, c1Result, c1Context, c1Bool, combinator1Result, combinator1Context, combinator1Bool);
    NodeCombinator combinator2(clk, selector, c2Result, c2Context, c2Bool, c3Result, c3Context, c3Bool, combinator2Result, combinator2Context, combinator2Bool);
    NodeCombinator combinator3(clk, selector, c4Result, c4Context, c4Bool, c5Result, c5Context, c5Bool, combinator3Result, combinator3Context, combinator3Bool);
    NodeCombinator combinator4(clk, selector, c6Result, c6Context, c6Bool, c7Result, c7Context, c7Bool, combinator4Result, combinator4Context, combinator4Bool);
    NodeCombinator combinator5(clk, selector, combinator1Result, combinator1Context, combinator1Bool, combinator2Result, combinator2Context, combinator2Bool, combinator5Result, combinator5Context, combinator5Bool);
    NodeCombinator combinator6(clk, selector, combinator3Result, combinator3Context, combinator3Bool, combinator4Result, combinator4Context, combinator4Bool, combinator6Result, combinator6Context, combinator6Bool);
    NodeCombinator combinator7(clk, selector, combinator5Result, combinator5Context, combinator5Bool, combinator6Result, combinator6Context, combinator6Bool, resultValue, combinator7Context, resultBool);
    
    
    
    
    always @ (posedge clk)
        begin
            if (reset == 1) begin
                if (resultBool == 0 && resultValue == 0)
                    reset = 0;
            end else begin
                in_metadata = combinator7Context;
                in_isMetadata = resultBool;
            end
        end
endmodule
