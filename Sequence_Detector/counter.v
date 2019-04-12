`timescale 1ns / 1ps
module counter
    #(parameter N=8)
    (
    input wire clk, reset,
    input wire up,
    output wire max_tick,
    output wire [N-1:0] q
    );
    
    reg [N-1:0] r_next, r_reg;
    
    //body
    // register and next state logic
    always @(posedge clk, posedge reset)
        if(reset)
            r_reg <= 0;
        else 
            r_reg <= r_next;
            
    // next state logic
    always@*
        if(up)
            r_next = r_reg +1;
        else
            r_next = r_reg;
            
    assign q = r_reg;
    assign max_tick = (r_reg == 2 **N-1) ? 1'b1: 1'b0;
    
endmodule
