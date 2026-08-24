`timescale 1ns / 1ps


module tb_clock(output logic clk = 1'b0);

    localparam time HALF_PERIOD = 14ns;
    
    always begin
        clk = 1'b1; #HALF_PERIOD;
        clk = 1'b0; #HALF_PERIOD;
    end

    task wait_cycles(input int cycles);
        repeat (cycles)
            @(posedge clk);
    endtask

endmodule