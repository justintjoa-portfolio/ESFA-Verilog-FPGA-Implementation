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
    input[7:0] queried_handle,
    input[7:0] new_index,
    input[7:0] new_value,
    output[0:0] resultBool,
    output[7:0] resultValue,
    input[7:0] selector
    );
    
    reg[7:0] given_code;
    reg[7:0] given_rank;
    reg[7:0] available_handle;
    reg[0:0] is_given_code;
    reg[0:0] is_given_rank;
    reg[0:0] is_available_handle;
    reg[7:0] combinator_selector;
    
    reg[7:0] given_code_next;
    reg[7:0] given_rank_next;
    reg[7:0] available_handle_next;
    reg[0:0] is_given_code_next;
    reg[0:0] is_given_rank_next;
    reg[0:0] is_available_handle_next;
    reg[7:0] combinator_selector_next;
    
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
    
    wire[7:0] combinator1Result;
    wire[7:0] combinator1Context;
    wire[0:0] combinator1Bool;
    
    wire[7:0] combinator2Result;
    wire[7:0] combinator2Context;
    wire[0:0] combinator2Bool;
    
    wire[7:0] combinator3Result;
    wire[7:0] combinator3Context;
    wire[0:0] combinator3Bool;
    
    wire[7:0] combinator4Result;
    wire[7:0] combinator4Context;
    wire[0:0] combinator4Bool;
    
    wire[7:0] combinator5Result;
    wire[7:0] combinator5Context;
    wire[0:0] combinator5Bool;
    
    wire[7:0] combinator6Result;
    wire[7:0] combinator6Context;
    wire[0:0] combinator6Bool;
    
    wire[7:0] combinator7Context;
    
    MemoryCell c0(clk, reset, c0Handle, queried_handle, is_available_handle, available_handle, new_index, new_value, is_given_code, given_code, is_given_rank, given_rank, selector, c0Bool, c0Result, c0Context);
    MemoryCell c1(clk, reset, c1Handle, queried_handle, is_available_handle, available_handle, new_index, new_value, is_given_code, given_code, is_given_rank, given_rank, selector, c1Bool, c1Result, c1Context);
    MemoryCell c2(clk, reset, c2Handle, queried_handle, is_available_handle, available_handle, new_index, new_value,  is_given_code, given_code, is_given_rank, given_rank, selector, c2Bool, c2Result, c2Context);
    MemoryCell c3(clk, reset, c3Handle, queried_handle, is_available_handle, available_handle, new_index, new_value, is_given_code, given_code, is_given_rank, given_rank, selector, c3Bool, c3Result, c3Context);
    MemoryCell c4(clk, reset, c4Handle, queried_handle, is_available_handle, available_handle, new_index, new_value, is_given_code, given_code, is_given_rank, given_rank, selector, c4Bool, c4Result, c4Context);
    MemoryCell c5(clk, reset, c5Handle, queried_handle, is_available_handle, available_handle, new_index, new_value, is_given_code, given_code, is_given_rank, given_rank, selector, c5Bool, c5Result, c5Context);
    MemoryCell c6(clk, reset, c6Handle, queried_handle, is_available_handle, available_handle, new_index, new_value, is_given_code, given_code, is_given_rank, given_rank, selector, c6Bool, c6Result, c6Context);
    MemoryCell c7(clk, reset, c7Handle,queried_handle,  is_available_handle, available_handle, new_index, new_value, is_given_code, given_code, is_given_rank, given_rank, selector, c7Bool, c7Result, c7Context);
    
    NodeCombinator combinator1(combinator_selector, c0Result, c0Context, c0Bool, c1Result, c1Context, c1Bool, combinator1Result, combinator1Context, combinator1Bool);
    NodeCombinator combinator2(combinator_selector, c2Result, c2Context, c2Bool, c3Result, c3Context, c3Bool, combinator2Result, combinator2Context, combinator2Bool);
    NodeCombinator combinator3(combinator_selector, c4Result, c4Context, c4Bool, c5Result, c5Context, c5Bool, combinator3Result, combinator3Context, combinator3Bool);
    NodeCombinator combinator4(combinator_selector, c6Result, c6Context, c6Bool, c7Result, c7Context, c7Bool, combinator4Result, combinator4Context, combinator4Bool);
    NodeCombinator combinator5(combinator_selector, combinator1Result, combinator1Context, combinator1Bool, combinator2Result, combinator2Context, combinator2Bool, combinator5Result, combinator5Context, combinator5Bool);
    NodeCombinator combinator6(combinator_selector, combinator3Result, combinator3Context, combinator3Bool, combinator4Result, combinator4Context, combinator4Bool, combinator6Result, combinator6Context, combinator6Bool);
    NodeCombinator combinator7(combinator_selector, combinator5Result, combinator5Context, combinator5Bool, combinator6Result, combinator6Context, combinator6Bool, resultValue, combinator7Context, resultBool);
    
    always @ (posedge clk)
        begin
            if (reset == 1'b0) begin
                    given_code <= 0;
                    given_rank <= 0;
                    available_handle <= 0;
                    is_given_code <= 0;
                    is_available_handle <= 0;
                    is_given_rank <= 0;
                    combinator_selector <= 8;
             end else begin   
                    given_code <= given_code_next; 
                    given_rank <= given_rank_next;  
                    available_handle <= available_handle_next;
                    is_given_code <= is_given_code_next; 
                    is_given_rank <= is_given_rank_next; 
                    is_available_handle <= is_available_handle_next;
                    combinator_selector <= combinator_selector_next;
             end
              
        end
        
   always @ (*) begin   
        given_code_next = given_code;
        given_rank_next = given_rank;
        available_handle_next = available_handle;
        is_given_code_next = is_given_code;
        is_given_rank_next = is_given_rank;
        is_available_handle_next = is_available_handle;
        combinator_selector_next = selector;
        case (selector)
             2: begin  
                  given_code_next = resultValue;
                  is_given_code_next = resultBool;
             end
             5: begin 
                 available_handle_next = resultValue;
                 is_available_handle_next = resultBool;
              end
              6:begin 
                  given_rank_next = resultValue;
                  is_given_rank_next = resultBool;
              end
              8: begin  
                  combinator_selector_next = combinator_selector;
              end
        endcase
   end
   
      
endmodule
