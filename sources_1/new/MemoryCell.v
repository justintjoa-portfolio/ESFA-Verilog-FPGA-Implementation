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
        input[0:0] clk,
        input[0:0] reset,
        input[7:0] handle, 
        input[7:0] inserted_index,
        input[7:0] inserted_value,
        input[7:0] metadata,
        input[0:0] isMetadata,
        input[7:0] selector,
        output reg[0:0] new_bool = 1'b0,
        output reg[7:0] new_result_value = 0,
        output reg[7:0] new_context = 0
    );
     
     reg[0:0] new_arrDef = 1'b0;
     reg[7:0] new_array_code = 0; 
     reg[0:0] new_eltDef = 1'b0;
     reg[7:0] new_rank = 0;
     reg[7:0] new_low = 0;
     reg[7:0] new_high = 0;
     reg[7:0] new_index = 0;
     reg[7:0] new_value = 0;
     
     reg[0:0] willOutput = 1'b0;
     
     reg[0:0] a_new_arrDef;
     reg[7:0] a_new_array_code; 
     reg[0:0] a_new_eltDef;
     reg[7:0] a_new_rank;
     reg[7:0] a_new_low;
     reg[7:0] a_new_high;
     reg[7:0] a_new_index;
     reg[7:0] a_new_value;
     reg[0:0] a_new_bool;
     reg[7:0] a_new_result_value;
     reg[7:0] a_new_context;
     
     reg[0:0] b_new_bool;
     reg[7:0] b_new_result_value;
     reg[7:0] b_new_context;
     
     reg[0:0] c_new_bool;
     reg[7:0] c_new_result_value;
     reg[7:0] c_new_context;
     
     reg[0:0] d_new_arrDef;
     reg[7:0] d_new_array_code; 
     reg[0:0] d_new_eltDef;
     reg[7:0] d_new_rank;
     reg[7:0] d_new_low;
     reg[7:0] d_new_high;
     reg[7:0] d_new_index;
     reg[7:0] d_new_value;
     reg[0:0] d_new_bool;
     reg[7:0] d_new_result_value;
     reg[7:0] d_new_context;
     
     reg[0:0] e_new_arrDef;
     reg[7:0] e_new_array_code; 
     reg[0:0] e_new_eltDef;
     reg[7:0] e_new_rank;
     reg[7:0] e_new_low;
     reg[7:0] e_new_high;
     reg[7:0] e_new_index;
     reg[7:0] e_new_value;
     reg[0:0] e_new_bool;
     reg[7:0] e_new_result_value;
     reg[7:0] e_new_context;
     
     reg[0:0] f_new_bool;
     reg[7:0] f_new_result_value;
     reg[7:0] f_new_context;
     
     
     reg[0:0] g_new_bool;
     reg[7:0] g_new_result_value;
     reg[7:0] g_new_context;
     
     reg[0:0] h_new_bool;
     reg[7:0] h_new_result_value;
     reg[7:0] h_new_context;
     
     
    //Map
    // 0 : update  
    // 1 : lookUpScan    
    // 2: encode     
    // 3: congrueUp 
    // 4: congrueDown
    // 5: markAvailableCell
    // 6: enrank
    // 7: debug
     
     /*
     
     if (r_willWrite) begin
                        new_arrDef <= new_arrDef_next;
                        new_array_code <= new_array_code_next;
                        new_eltDef <= new_eltDef_next;
                        new_rank <= new_rank_next;
                        new_low <= new_low_next;
                        new_high <= new_high_next;
                        new_index <= new_index_next;
                        new_value <= new_value_next;
                    end
                    new_bool <= new_bool_next;
                    new_result_value <= new_result_value_next;
                    new_context <= new_context_next;*/
     
    always @ (posedge clk)
        begin
                if (reset == 1'b0) begin
                    new_arrDef <= 1'b0;
                    new_array_code <= 0;
                    new_eltDef <= 1'b0;
                    new_rank <= 0;
                    new_low <= 0;
                    new_high <= 0;
                    new_index <= 0;
                    new_value <= 0;
                end else begin 
                    if (willOutput) begin  
                        case (selector) 
                            0: begin   
                                new_arrDef <= a_new_arrDef;
                                new_array_code <= a_new_array_code;
                                new_eltDef <= a_new_eltDef;
                                new_low <= a_new_low;
                                new_high <= a_new_high;
                                new_value <= a_new_value;
                                new_index <= a_new_index;
                                new_rank <= a_new_rank;
                                
                                new_bool <= a_new_bool; 
                                new_result_value <= a_new_result_value; 
                                new_context <= a_new_context;
                                
                            end  
                            1: begin   
                                new_bool <= b_new_bool; 
                                new_result_value <= b_new_result_value; 
                                new_context <= b_new_context;
                            end
                            
                            2: begin  
                                new_bool <= c_new_bool; 
                                new_result_value <= c_new_result_value; 
                                new_context <= c_new_context;
                            end  
                            
                            3: begin   
                                new_arrDef <= d_new_arrDef;
                                new_array_code <= d_new_array_code;
                                new_eltDef <= d_new_eltDef;
                                new_low <= d_new_low;
                                new_high <= d_new_high;
                                new_value <= d_new_value;
                                new_index <= d_new_index;
                                new_rank <= d_new_rank;
                                
                                new_bool <= d_new_bool; 
                                new_result_value <= d_new_result_value; 
                                new_context <= d_new_context;
                            end    
                            
                            
                            4: begin   
                                new_arrDef <= e_new_arrDef;
                                new_array_code <= e_new_array_code;
                                new_eltDef <= e_new_eltDef;
                                new_low <= e_new_low;
                                new_high <= e_new_high;
                                new_value <= e_new_value;
                                new_index <= e_new_index;
                                new_rank <= e_new_rank;
                                
                                new_bool <= e_new_bool; 
                                new_result_value <= e_new_result_value; 
                                new_context <= e_new_context;
                            end   
                            
                            
                            5: begin   
                                new_bool <= f_new_bool; 
                                new_result_value <= f_new_result_value; 
                                new_context <= f_new_context;
                            end   
                            
                            6: begin   
                                new_bool <= g_new_bool; 
                                new_result_value <= g_new_result_value; 
                                new_context <= g_new_context;
                            
                            end   
                            
                            
                            7: begin   
                                new_bool <= h_new_bool; 
                                new_result_value <= h_new_result_value; 
                                new_context <= h_new_context;
                            end
                            
                        endcase
                    end
                
                end
     
    end
    
    always @(inserted_index, inserted_value, metadata, isMetadata, selector) begin   
        a_new_arrDef = new_arrDef;
        a_new_array_code = new_array_code;
        a_new_eltDef = new_eltDef;
        a_new_low = new_low;
        a_new_high = new_high;
        a_new_value = new_value;
        a_new_index = new_index;
        a_new_rank = new_rank;
        
        a_new_bool = (metadata == handle) && isMetadata;
               
         if (a_new_bool) begin  
              a_new_arrDef = 1'b1;
              a_new_array_code = handle;
              a_new_eltDef = 1'b1;
              a_new_low = handle;
              a_new_high = handle;
              a_new_value = inserted_value;
              a_new_index = inserted_index;
              a_new_rank = 1;
          end   
          a_new_result_value = handle;
          a_new_context = handle;
    end
    
    always @(inserted_index, inserted_value, metadata, isMetadata, selector) begin   
        b_new_bool = (new_index == inserted_index) && (metadata >= new_low) && (metadata <= new_high) && (isMetadata);
        b_new_result_value = new_value;
        b_new_context = new_rank;
    end
    
    always @(inserted_index, inserted_value, metadata, isMetadata, selector) begin   
        c_new_bool = (!(!isMetadata || metadata > 7)) && (new_arrDef) && (isMetadata) && (metadata  == handle);
        c_new_result_value = new_array_code;
        c_new_context = new_array_code;
    end
    
    always @(inserted_index, inserted_value, metadata, isMetadata, selector) begin   
        d_new_arrDef = new_arrDef;
        d_new_array_code = new_array_code;
        d_new_eltDef = new_eltDef;
        d_new_low = new_low;
        d_new_high = new_high;
        d_new_value = new_value;
        d_new_index = new_index;
        d_new_rank = new_rank;
        
        if (inserted_index == handle) begin   
            if (isMetadata) begin    
                d_new_array_code = metadata + 1;
                d_new_high = metadata + 1;
                d_new_low = metadata + 1;
                d_new_rank = inserted_value + 1;
             end
         end else begin     
             if (new_array_code > metadata && isMetadata && new_arrDef) begin 
                 d_new_array_code = new_array_code + 1;
              end
              if (new_eltDef && isMetadata) begin 
                  if (new_low > metadata) begin 
                       d_new_low = new_low + 1;
                  end
                  if (new_high >= metadata) begin 
                       d_new_high = new_high + 1;
                  end
               end
         end
    end
    
    always @(inserted_index, inserted_value, metadata, isMetadata, selector) begin   
        e_new_arrDef = new_arrDef;
        e_new_array_code = new_array_code;
        e_new_eltDef = new_eltDef;
        e_new_low = new_low;
        e_new_high = new_high;
        e_new_value = new_value;
        e_new_index = new_index;
        e_new_rank = new_rank;
        
        if (inserted_index == handle && isMetadata) begin    
             e_new_arrDef = 1'b0;
             e_new_rank  = 0;
        end
                       
        if (new_eltDef && isMetadata && metadata < new_low) begin  
            e_new_high = new_high - 1;
            e_new_low = new_low - 1;
        end else begin   
            if (new_eltDef && isMetadata && (new_low <= metadata && metadata <= new_high)) begin 
                   e_new_high = new_high - 1;
            end
        end
        if (new_eltDef && new_low_next > new_high_next) begin 
              e_new_eltDef = 1'b0;
              e_new_arrDef = 1'b0;
        end
        if (new_arrDef && isMetadata && new_array_code > metadata) begin 
              e_new_array_code = new_array_code - 1;
        end
    end
    
    always @(inserted_index, inserted_value, metadata, isMetadata, selector) begin   
        f_new_bool = ! new_eltDef;
        f_new_result = handle;
        f_new_context = handle;
    end
    
    always @(inserted_index, inserted_value, metadata, isMetadata, selector) begin   
        g_new_bool = (!(!isMetadata || metadata > 7)) && (new_arrDef) && (isMetadata) && (metadata  == handle);
        g_new_result_value = new_rank;
        g_new_context = new_rank;
    end
    
    always @(inserted_index, inserted_value, metadata, isMetadata, selector) begin   
        h_new_bool = (!(metadata > 7)) && (metadata  == handle);
        h_new_result_value = new_high;
        h_new_context = new_high;
    end
    
    always @(inserted_index, inserted_value, metadata, isMetadata, selector) begin
        willOutput = 1'b1;      
    end   
  
endmodule




