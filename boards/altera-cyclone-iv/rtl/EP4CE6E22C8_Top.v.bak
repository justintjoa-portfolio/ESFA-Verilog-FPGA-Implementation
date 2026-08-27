module EPT4CE6Top (
    input  wire clk,
    output wire led
);

    reg [25:0] counter = 26'd0;
    reg [25:0] counter_next = 26'd0;

    always @(posedge clk) begin
        counter <= counter_next;
    end

    assign led = counter[25];

    always @ (*) begin   
        counter_next = counter + 1; 
   end

endmodule