`timescale 1ns / 1ps

module lfsr_tb();
    //declerations
    parameter T = 20; //clock period in nanoseconds
    reg clk, reset;
    wire [11:0 ]test_output;
    wire test_max_tick;
    
    // Instantiate the LFSR module
    lfsr uut(
        .clk(clk),
        .reset(reset),
        .lfsr_out(test_output),
        .max_tick(test_max_tick)
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
