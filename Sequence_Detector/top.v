`timescale 1ns / 1ps
module top(
    input CCLK, // Crystal Clock Oscillator
    input wire reset,
    output wire lfsr_out,
    output wire max_tick,
    output wire [3:0] an,
    output wire [7:0] sseg,
    output wire clk
    );
    
    // signal declaration
    wire tick;  
    wire [3:0]  d3, d2, d1, d0;
    
    
    clock clock(
        .CCLK(CCLK),
        .clk_scale(10000000), // A clock with a period of 0.2 s
        .clk(clk)
    );
    
    lfsr lfsr(
        .clk(clk),
        .reset(reset),
        .lfsr_out(lfsr_out),
        .max_tick(max_tick)
    );

    
    fsm_detector fsm(
        .clk(clk),
        .reset(reset),
        .sequence(lfsr_out),
        .tick(tick)
    );
    
    count_7seg count_7seg(
        .clk(clk),
        .up(tick),
        .reset(reset),
        .max_tick(max_tick),
        .d3(d3),
        .d2(d2),
        .d1(d1),
        .d0(d0)
    );
    
    disp_hex_mux disp_unit (
        .clk(CCLK),
        .reset(reset),
        .hex3(d3),
        .hex2(d2),
        .hex1(d1),
        .hex0(d0),
        .dp_in(4'b1111), // turn off decimal points 
        .an(an), 
        .sseg(sseg));
        
        
endmodule
