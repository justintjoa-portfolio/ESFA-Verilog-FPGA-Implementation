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
    input clk, 
    input new_index,
    input new_value,
    input queried_handle,
    input isHandle,
    output resultBool,
    output resultValue,
    input selector
    );
    
    wire c0Handle;
    wire c0Result;
    wire c0Context;
    wire c0Bool;
    
    wire c1Handle;
    wire c1Result;
    wire c1Context;
    wire c1Bool;
    
    wire c2Handle;
    wire c2Result;
    wire c2Context;
    wire c2Bool;
    
    wire c3Handle;
    wire c3Result;
    wire c3Context;
    wire c3Bool;
    
    wire c4Handle;
    wire c4Result;
    wire c4Context;
    wire c4Bool;
    
    wire c5Handle;
    wire c5Result;
    wire c5Context;
    wire c5Bool;
    
    wire c6Handle;
    wire c6Result;
    wire c6Context;
    wire c6Bool;
    
    wire c7Handle;
    wire c7Result;
    wire c7Context;
    wire c7Bool;
    
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
    
    reg metadata;
    reg[0:0] isMetadata;
    
    wire in_metadata;
    assign in_metadata = metadata;
    wire[0:0] in_isMetadata;
    assign in_isMetadata = isMetadata;
   
    
    MemoryCell c0(clk, new_index, new_value, queried_handle, isHandle, in_metadata, in_isMetadata, selector, c0Bool, c0Result, c0Context);
    MemoryCell c1(clk, new_index, new_value, queried_handle, isHandle, in_metadata, in_isMetadata,  selector, c1Bool, c1Result, c1Context);
    MemoryCell c2(clk, new_index, new_value, queried_handle, isHandle, in_metadata, in_isMetadata, selector, c2Bool, c2Result, c2Context);
    MemoryCell c3(clk, new_index, new_value, queried_handle, isHandle, in_metadata, in_isMetadata, selector, c3Bool, c3Result, c3Context);
    MemoryCell c4(clk, new_index, new_value, queried_handle, isHandle, in_metadata, in_isMetadata, selector, c4Bool, c4Result, c4Context);
    MemoryCell c5(clk, new_index, new_value, queried_handle, isHandle, in_metadata, in_isMetadata, selector, c5Bool, c5Result, c5Context);
    MemoryCell c6(clk, new_index, new_value, queried_handle, isHandle, in_metadata, in_isMetadata, selector, c6Bool, c6Result, c6Context);
    
    NodeCombinator combinator1(clk, selector, c0Result, c0Context, c0Bool, c1Result, c1Context, c1Bool, combinator1Result, combinator1Context, combinator1Bool);
    NodeCombinator combinator2(clk, selector, c2Result, c2Context, c2Bool, c3Result, c3Context, c3Bool, combinator2Result, combinator2Context, combinator2Bool);
    NodeCombinator combinator3(clk, selector, c4Result, c4Context, c4Bool, c5Result, c5Context, c5Bool, combinator3Result, combinator3Context, combinator3Bool);
    NodeCombinator combinator4(clk, selector, c6Result, c6Context, c6Bool, c7Result, c7Context, c7Bool, combinator4Result, combinator4Context, combinator4Bool);
    NodeCombinator combinator5(clk, selector, combinator1Result, combinator1Context, combinator1Bool, combinator2Result, combinator2Context, combinator2Bool, combinator5Result, combinator5Context, combinator5Bool);
    NodeCombinator combinator6(clk, selector, combinator3Result, combinator3Context, combinator3Bool, combinator4Result, combinator4Context, combinator4Bool, combinator6Result, combinator6Context, combinator6Bool);
    NodeCombinator combinator7(clk, selector, combinator5Result, combinator5Context, combinator5Bool, combinator6Result, combinator6Context, combinator6Bool, resultValue, combinator7Context, resultBool);
    
    
    
    
    always @ (posedge clk)
        begin
            metadata = combinator7Context;
            isMetadata = resultBool;
        end
    
endmodule
