`timescale 1ns / 1ps
module alu(
    
    input wire [2:0] fxn, //fxn allows you to select function of ALU
    input wire [5:0] input_a,
    input wire [5:0] input_b,
    output wire [5:0] out, //  6 bit result of operation
    output wire o_flow, c_out // overflow and carry out signals

    );
    
    
    // Internal signals used
    wire [5:0] add_output;
    wire comparator_output;
    wire [5:0] xor_output;
    
    // Instantiate the output multiplexer.
    // This is the brain of the operation 
    // It sets the correct output value based on fxn value
    output_mux out_mux(
        .fxn_code(fxn),
        .a(input_a),
        .b(input_b),
        .adder_out(add_output),
        .comp_out(comparator_output),
        .xor_out(xor_output),
        .final_out(out) 
    );
    
    // Instantiate the 6bit ripple adder
    ripple_adder adder (
        .x(input_a),
        .y(input_b),
        .sel(fxn[0]), // The LSB of fxn indicates whether to add/subtract
        .sum(add_output),
        .overflow(o_flow),
        .cout(c_out)
    );
    
    // Instantiate the 8bit comparator
    compare8 comparator(
        .a({2'b00, input_a}), // concatenate two zeros with 6bit input so 8bit comparator can be used
        .b({2'b00, input_b}),
        .a_geq_b(comparator_output)
    );
    
    //Instantiate the xor module
    xor_6bit xor_6bit(
        .a(input_a),
        .b(input_b),
        .xor_result(xor_output)
    );
    
     
endmodule
