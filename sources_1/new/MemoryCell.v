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
        input[7:0] handle, 
        input[7:0] inserted_index,
        input[7:0] inserted_value,
        input[7:0] metadata,
        input[0:0] isMetadata,
        input[7:0] selector,
        output reg[0:0] new_bool = 0,
        output reg[7:0] new_result_value = 0,
        output reg[7:0] new_context = 0
    );
     
     reg[0:0] r_willWrite = 1'b0;
     reg[0:0] new_arrDef = 0;
     reg[0:0] new_arrDef_next = 0;
     reg[7:0] new_array_code = 0; 
     reg[7:0] new_array_code_next = 0;
     reg[0:0] new_eltDef = 0;
     reg[0:0] new_eltDef_next = 0;
     reg[7:0] new_rank = 0;
     reg[7:0] new_rank_next = 0;
     reg[7:0] new_low = 0;
     reg[7:0] new_low_next = 0;
     reg[7:0] new_high = 0;
     reg[7:0] new_high_next = 0;
     reg[7:0] new_index = 0;
     reg[7:0] new_index_next = 0;
     reg[7:0] new_value = 0;
     reg[7:0] new_value_next = 0;
     reg[0:0] new_bool_next = 0;
     reg[7:0] new_result_value_next = 0;
     reg[7:0] new_context_next = 0;
    

   /*
    
    // output wires for each combinator block
    wire[0:0] a_resultBool, a_arrDef, a_eltDef;
    wire [7:0] a_resultValue, a_resultContext, a_array_code, a_rank, a_low, a_high, a_index, a_value;

    wire[0:0] b_resultBool;
    wire [7:0] b_resultValue, b_resultContext;
    
    wire[0:0] c_resultBool;
    wire [7:0] c_resultValue, c_resultContext;
    
    wire[0:0] d_resultBool, d_arrDef, d_eltDef;
    wire [7:0] d_resultValue, d_resultContext, d_array_code, d_rank, d_low, d_high, d_index, d_value;
    
    wire[0:0] e_resultBool, e_arrDef, e_eltDef;
    wire [7:0] e_resultValue, e_resultContext, e_array_code, e_rank, e_low, e_high, e_index, e_value;
    
    wire[0:0] f_resultBool;
    wire [7:0] f_resultValue, f_resultContext;
    
    wire[0:0] g_resultBool;
    wire [7:0] g_resultValue, g_resultContext;
    
    wire[0:0] h_resultBool;
    wire [7:0] h_resultValue, h_resultContext;
    */
    /*
   updateDesign updater(new_arrDef, handle, new_array_code, new_eltDef, new_rank, new_low, new_high, new_index, new_value, inserted_index, inserted_value, 
   metadata, isMetadata, a_resultBool, a_resultValue, a_resultContext, a_arrDef, a_array_code, a_eltDef, a_rank, a_low, a_high, a_index, a_value);
   
   lookUp lookScan(new_arrDef, handle, new_array_code, new_eltDef, new_rank, new_low, new_high, new_index, new_value, inserted_index, inserted_value, 
   metadata, isMetadata, b_resultBool, b_resultValue, b_resultContext);
   
   encode encoder(new_arrDef, handle, new_array_code, new_eltDef, new_rank, new_low, new_high, new_index, new_value, inserted_index, inserted_value, 
   metadata, isMetadata, c_resultBool, c_resultValue, c_resultContext);
   
   
   congrueUpDesign upEqualizer(new_arrDef, handle, new_array_code, new_eltDef, new_rank, new_low, new_high, new_index, new_value, inserted_index, inserted_value, 
   metadata, isMetadata, d_resultBool, d_resultValue, d_resultContext, d_arrDef, d_array_code, d_eltDef, d_rank, d_low, d_high, d_index, d_value);
   
   congrueDownDesign downEqualizer(new_arrDef, handle, new_array_code, new_eltDef, new_rank, new_low, new_high, new_index, new_value, inserted_index, inserted_value,
   metadata, isMetadata, e_resultBool, e_resultValue,  e_resultContext, e_arrDef, e_array_code, e_eltDef, e_rank, e_low, e_high, e_index, e_value);
   
   markAvailableCell vacantCellMarker(new_arrDef, handle, new_array_code, new_eltDef, new_rank, new_low, new_high, new_index, new_value, inserted_index, inserted_value,
   metadata, isMetadata, f_resultBool, f_resultValue, f_resultContext);
    
   enrank enranker(new_arrDef, handle, new_array_code, new_eltDef, new_rank, new_low, new_high, new_index, new_value, inserted_index, inserted_value,
   metadata, isMetadata, g_resultBool, g_resultValue,  g_resultContext); 
   
   enRange enranger(new_arrDef, handle, new_array_code, new_eltDef, new_rank, new_low, new_high, new_index, new_value, inserted_index, inserted_value,
   metadata, isMetadata, h_resultBool, h_resultValue,  h_resultContext); 
   */
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
                new_context <= new_context_next;
     
    end
            
            
    always @* begin
               r_willWrite = 1'b0;
               if (selector == 8'b0) begin
                    new_bool_next = (metadata == handle) && isMetadata;
               
                    if (new_bool_next) begin  
                        new_arrDef_next = 1'b1;
                        new_array_code_next = handle;
                        new_eltDef_next = 1'b1;
                        new_low_next = handle;
                        new_high_next = handle;
                        new_value_next = inserted_value;
                        new_index_next = inserted_index;
                        new_rank_next = 1;
                    end   
                    new_result_value_next = handle;
                    new_context_next = handle;
                    r_willWrite = 1'b1;
                  
                end
                if (selector == 8'b1) begin
                
                    new_bool_next = (index == inserted_index) && (metadata >= new_low_next) && (metadata <= new_high) && (isMetadata);
                    new_result_value_next = new_value;
                    new_context_next = new_rank;
                end
                if (selector == 8'b10) begin
                    
                    new_bool_next = (!(!isMetadata || metadata > 7)) && (new_arrDef) && (isMetadata) && (metadata  == handle);
                    new_result_value_next = new_array_code;
                    new_context_next = new_array_code;
                end
                if (selector == 8'b11) begin
                   if (inserted_index == handle) begin   
                        if (isMetadata) begin    
                            new_array_code_next = metadata + 1;
                            new_high_next = metadata + 1;
                            new_low_next = metadata + 1;
                            new_rank_next = inserted_value + 1;
                        end
                   end else begin     
                        if (new_array_code > metadata && isMetadata && new_arrDef) begin 
                            new_array_code_next = new_array_code + 1;
                        end
                        if (new_eltDef && isMetadata) begin 
                            if (new_low > metadata) begin 
                                new_low_next = new_low + 1;
                            end
                            if (new_high >= metadata) begin 
                                new_high_next = new_high + 1;
                            end
                        end
                   end
                    r_willWrite = 1'b1;
                end
                if (selector == 8'b100) begin
                   if (inserted_index == handle) begin   
                        if (isMetadata) begin    
                            new_arrDef_next = 1'b0;
                            new_rank_next = 0;
                        end
                    if (new_eltDef && isMetadata && metadata < new_low) begin  
                        new_high_next = new_high - 1;
                        new_low_next = new_low - 1;
                    end else begin   
                        if (new_eltDef && isMetadata && (new_low <= metadata && metadata <= new_high)) begin 
                            new_high_next = new_high - 1;
                        end
                    end
                    if (new_eltDef && new_low_next > new_high_next) begin 
                        new_eltDef_next = 1'b0;
                        new_arrDef_next = 1'b0;
                    end
                    if (arrDef && isMetadata && new_array_code > metadata) begin 
                        new_array_code_next = new_array_code - 1;
                    end

                    r_willWrite = 1'b1;
                end
                if (selector == 8'b101) begin
                    
                    new_bool_next = ! new_eltDef;
                    new_result_value_next = handle;
                    new_context_next = handle;
                end
                if (selector == 8'b110) begin
                
                    new_bool_next = (!(!isMetadata || metadata > 7)) && (new_arrDef) && (isMetadata) && (metadata  == handle);
                    new_result_value_next = new_rank;
                    new_context_next = new_rank;
                end  
                if (selector == 8'b111) begin
                
                    new_bool_next = (!(metadata > 7)) && (new_eltDef) && (metadata  == handle);
                    new_result_value_next = isMetadata ? new_high : new_low;
                    new_context_next = result_value_next;
                end 
            end
        end
endmodule




