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
    
    wire none;
    assign none = 1'b0;
    
    wire root1Result;
    wire root1Context;
    wire root1Bool;
    wire root2Result;
    wire root2Context;
    wire root2Bool;
    wire root3Result;
    wire root3Context;
    wire root3Bool;
    wire root4Result;
    wire root4Context;
    wire root4Bool;
    
    wire internal1Result;
    wire internal1Context;
    wire internal1Bool;
    wire internal2Result;
    wire internal2Context;
    wire internal2Bool;
    
    wire leaf1Result;
    wire leaf1Bool;
    wire leaf1Context;
    
    assign resultValue = leaf1Result;
    assign resultBool = leaf1Bool;
    
    wire combinator1Result;
    wire combinator1Context;
    wire combinator1Bool;
    
    wire combinator2Result;
    wire combinator2Context;
    wire combinator2Bool;
    
    wire combinator3Result;
    wire combinator3Context;
    wire combinator3Bool;
    
    MemoryCell root1(clk, new_index, new_value, queried_handle, isHandle, in_metadata, in_isMetadata, none, none, none, selector, root1Bool, root1Result, root1Context);
    MemoryCell root2(clk, new_index, new_value, queried_handle, isHandle, in_metadata, in_isMetadata, none, none, none, selector, root2Bool, root2Result, root2Context);
    MemoryCell root3(clk, new_index, new_value, queried_handle, isHandle, in_metadata, in_isMetadata, none, none, none, selector, root3Bool, root3Result, root3Context);
    MemoryCell root4(clk, new_index, new_value, queried_handle, isHandle, in_metadata, in_isMetadata, none, none, none, selector, root4Bool, root4Result, root4Context);
    NodeCombinator combinator1(clk, selector, root1Result, root1Context, root1Bool, root2Result, root2Context, root2Bool, combinator1Result, combinator1Context, combinator1Bool);
    NodeCombinator combinator2(clk, selector, root3Result, root3Context, root3Bool, root4Result, root4Context, root4Bool, combinator2Result, combinator2Context, combinator2Bool);
    MemoryCell internal1(clk, new_index, new_value, queried_handle, isHandle, in_metadata, in_isMetadata, combinator1Result, combinator1Context, combinator1Bool, selector, internal1Bool, internal1Result, internal1Context);
    MemoryCell internal2(clk, new_index, new_value, queried_handle, isHandle, in_metadata, in_isMetadata, combinator2Result, combinator2Context, combinator2Bool, selector, internal2Bool, internal2Result, internal2Context);
    NodeCombinator combinator3(clk, selector, interal1Result, internal1Context, internal1Bool, internal2Result, internal2Context, interal2Bool, combinator3Result, combinator3Context, combinator3Bool);
    MemoryCell leaf1(clk, new_index, new_value, queried_handle, isHandle, in_metadata, in_isMetadata, combinator3Result, combinator3Context, combinator3Bool, selector, leaf1Bool, leaf1Result, leaf1Context);
    
    
    reg metadata;
    reg[0:0] isMetadata;
    
    wire in_metadata;
    assign in_metadata = metadata;
    wire[0:0] in_isMetadata;
    assign in_isMetadata = isMetadata;
   
    
    always @ (posedge clk)
        begin
            metadata = leaf1Context;
            isMetadata = resultBool;
        end
    
endmodule
