`timescale 1ns / 1ps
module top(
    input CCLK,
    input wire reset,
    output wire max_tick,
    output wire [11:0] lfsr_out,
    output wire clk
    );
    
    
    clock clock(
        .CCLK(CCLK),
        .clk_scale(50000000), // A clock with a period of 1s
        .clk(clk)
    );
    
    lfsr lfsr(
        .clk(clk),
        .reset(reset),
        .lfsr_out(lfsr_out),
        .max_tick(max_tick)
    );
    
endmodule
