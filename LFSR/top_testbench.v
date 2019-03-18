`timescale 1ns / 1ps
module top_tb();
    
    parameter T = 20; //clock period in nanoseconds
    reg clk, reset;
    wire max_tick;
    wire [11:0] lfsr_out;
    
   // Instantiate the LFSR module
    top uut(
    .CCLK (clk),
    .reset(reset),
    .max_tick(max_tick),
    .lfsr_out(lfsr_out)
    );
    
    // clock
    // 20 ns clock running forever
    always
    begin
        clk = 1'b1; //high
        #(T/2); // delay half a period
        clk = 1'b0; //low
        #(T/2); // delay half a period
    end
    
    // reset for first 2 clock cycles
    initial
    begin
        reset = 1'b1;
        #(2*T); // delay 2 clock cycles
        reset = 1'b0;
    end
endmodule
