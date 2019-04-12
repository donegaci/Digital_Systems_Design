`timescale 1ns / 1ps
module top_tb();
    
    parameter T = 20; //clock period in nanoseconds
    reg test_CCLK;
    reg test_reset;
    wire max_tick;
//    wire clk;
    wire lfsr_out;
    wire [3:0] d3, d2, d1, d0;
    
    
    top uut(
        .CCLK(test_CCLK),
        .reset(test_reset),
        .lfsr_out(lfsr_out),
        .d3(d3),
        .d2(d2),
        .d1(d1),
        .d0(d0)
//        .clk(clk)
    );
    
    // clock
    // 20 ns clock running forever
    always
    begin
        test_CCLK = 1'b1; //high
        #(T/2); // delay half a period
        test_CCLK = 1'b0; //low
        #(T/2); // delay half a period
    end
    
    // reset for first 2 clock cycles
    initial
    begin
        test_reset <= 1'b1;
        #(2*T); // delay 2 clock cycles
        test_reset <= 1'b0;
    end
endmodule
