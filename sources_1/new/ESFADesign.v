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
    input[0:0] reset,
    input[7:0] new_index,
    input[7:0] new_value,
    input[7:0] metadata,
    input[0:0] isMetadata,
    output[0:0] resultBool,
    output[7:0] resultValue,
    output reg[23:0] timingValue,
    input[7:0] selector
    );
   
    
    wire[7:0] c0Handle;
    assign c0Handle = 0;
    wire[7:0] c0Result;
    wire[7:0] c0Context;
    wire[0:0] c0Bool;
    wire[0:0] c0opdone;
    
    wire[7:0] c1Handle;
    assign c1Handle = 1;
    wire[7:0] c1Result;
    wire[7:0] c1Context;
    wire[0:0] c1Bool;
    wire[0:0] c1opdone;
    
    wire[7:0] c2Handle;
    assign c2Handle = 2;
    wire[7:0] c2Result;
    wire[7:0] c2Context;
    wire[0:0] c2Bool;
    wire[0:0] c2opdone;
    
    wire[7:0] c3Handle;
    assign c3Handle = 3;
    wire[7:0] c3Result;
    wire[7:0] c3Context;
    wire[0:0] c3Bool;
    wire[0:0] c3opdone;
    
    wire[7:0] c4Handle;
    assign c4Handle = 4;
    wire[7:0] c4Result;
    wire[7:0] c4Context;
    wire[0:0] c4Bool;
    wire[0:0] c4opdone;
    
    wire[7:0] c5Handle;
    assign c5Handle = 5;
    wire[7:0] c5Result;
    wire[7:0] c5Context;
    wire[0:0] c5Bool;
    wire[0:0] c5opdone;
    
    wire[7:0] c6Handle;
    assign c6Handle = 6;
    wire[7:0] c6Result;
    wire[7:0] c6Context;
    wire[0:0] c6Bool;
    wire[0:0] c6opdone;
    
    wire[7:0] c7Handle;
    assign c7Handle = 7;
    wire[7:0] c7Result;
    wire[7:0] c7Context;
    wire[0:0] c7Bool;
    wire[0:0] c7opdone;
    
    wire[7:0] combinator1Result;
    wire[7:0] combinator1Context;
    wire[0:0] combinator1Bool;
    wire[0:0] combinator1opdone;
    
    wire[7:0] combinator2Result;
    wire[7:0] combinator2Context;
    wire[0:0] combinator2Bool;
    wire[0:0] combinator2opdone;
    
    wire[7:0] combinator3Result;
    wire[7:0] combinator3Context;
    wire[0:0] combinator3Bool;
    wire[0:0] combinator3opdone;
    
    wire[7:0] combinator4Result;
    wire[7:0] combinator4Context;
    wire[0:0] combinator4Bool;
    wire[0:0] combinator4opdone;
    
    wire[7:0] combinator5Result;
    wire[7:0] combinator5Context;
    wire[0:0] combinator5Bool;
    wire[0:0] combinator5opdone;
    
    wire[7:0] combinator6Result;
    wire[7:0] combinator6Context;
    wire[0:0] combinator6Bool;
    wire[0:0] combinator6opdone;
    
    wire[7:0] combinator7Context;
    wire[0:0] combinator7opdone;
   
    
    MemoryCell c0(clk, reset, c0Handle, new_index, new_value, metadata, isMetadata, selector, c0Bool, c0Result, c0Context, c0opdone);
    MemoryCell c1(clk, reset, c1Handle, new_index, new_value, metadata, isMetadata,  selector, c1Bool, c1Result, c1Context, c1opdone);
    MemoryCell c2(clk, reset, c2Handle, new_index, new_value,  metadata, isMetadata, selector, c2Bool, c2Result, c2Context, c2opdone);
    MemoryCell c3(clk, reset, c3Handle, new_index, new_value, metadata, isMetadata, selector, c3Bool, c3Result, c3Context, c3opdone);
    MemoryCell c4(clk, reset, c4Handle, new_index, new_value, metadata, isMetadata, selector, c4Bool, c4Result, c4Context, c4opdone);
    MemoryCell c5(clk, reset, c5Handle, new_index, new_value, metadata, isMetadata, selector, c5Bool, c5Result, c5Context, c5opdone);
    MemoryCell c6(clk, reset, c6Handle, new_index, new_value, metadata, isMetadata, selector, c6Bool, c6Result, c6Context, c6opdone);
    MemoryCell c7(clk, reset, c7Handle, new_index, new_value, metadata, isMetadata, selector, c7Bool, c7Result, c7Context, c7opdone);
    
    NodeCombinator combinator1(selector, c0Result, c0Context, c0Bool, c0opdone, c1Result, c1Context, c1Bool, c1opdone, combinator1Result, combinator1Context, combinator1Bool, combinator1opdonetor1opdone);
    NodeCombinator combinator2(selector, c2Result, c2Context, c2Bool, c2opdone, c3Result, c3Context, c3Bool, c3opdone, combinator2Result, combinator2Context, combinator2Bool, combinator2opdone);
    NodeCombinator combinator3(selector, c4Result, c4Context, c4Bool, c4opdone, c5Result, c5Context, c5Bool, c5opdone, combinator3Result, combinator3Context, combinator3Bool, combinator3opdone);
    NodeCombinator combinator4(selector, c6Result, c6Context, c6Bool, c6opdone, c7Result, c7Context, c7Bool, c7opdone, combinator4Result, combinator4Context, combinator4Bool, combinator4opdone);
    NodeCombinator combinator5(selector, combinator1Result, combinator1Context, combinator1Bool, combinator1opdone, combinator2Result, combinator2Context, combinator2Bool, combinator2opdone, combinator5Result, combinator5Context, combinator5Bool, combinator5opdone);
    NodeCombinator combinator6(selector, combinator3Result, combinator3Context, combinator3Bool, combinator3opdone, combinator4Result, combinator4Context, combinator4Bool, combinator4opdone, combinator6Result, combinator6Context, combinator6Bool, combinator6opdone);
    NodeCombinator combinator7(selector, combinator5Result, combinator5Context, combinator5Bool, combinator5opdone, combinator6Result, combinator6Context, combinator6Bool, combinator6opdone, resultValue, combinator7Context, resultBool, combinator7opdone);
    
   
    always @ (posedge clk)
        begin
                if (reset == 1'b0) begin
                    timingValue <= 0;
                end else begin  
                      if (! combinator7opdone) begin   
                            timingValue <= timingValue + 1; 
                      end
                end
                
     end
   
      
endmodule
