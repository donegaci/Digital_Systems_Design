`timescale 1ns / 1ps
//
// The clk_scale is calculated as follows:
// clk_scale = desired period / (2 x (CCLK Period))
// Basys3 Board has 100 MHz oscillator
// CCLK period = 10 x 10^-9
//
module clock(
    input CCLK, // crystal clock oscillator of 100 MHz
    input [31:0] clk_scale,
    output reg clk
    );
    
    reg [31:0] clkq = 0; // clock register, initial value of 0
    
    // Blocking statements are used inside a clocked always block here
    // This is ok since it defines the clock to be used for the entire design
    always @ (posedge CCLK)
    begin
        clkq = clkq + 1; // increment clock register
        
        // only change clock value if it is >= the scalinig paramater
        if (clkq >= clk_scale) // clock scaling
            begin
                clk = ~clk; // invert the clock output
                clkq = 0; // reset the clock register
            end
        
    end
endmodule
