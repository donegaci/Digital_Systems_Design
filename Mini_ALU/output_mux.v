`timescale 1ns / 1ps
// Sets the ALU output based on the fxn instruction
module output_mux(
    input wire [2:0] fxn_code, // fxn instruction
    input wire [5:0] a, // input a
    input wire [5:0] b, // input b
    input wire [5:0] adder_out, // output of adder
    input wire comp_out, // output of comparator
    input wire [5:0] xor_out, // output of xor
    output reg [5:0] final_out // using a reg since value will be changed in always block
    );
    
    reg [2:0]instruct; // internal reg of fxn code since will be change in always block
    
    always @(*)
        begin
            instruct = fxn_code;
            case(instruct)
                3'b000: final_out = a;
                3'b001: final_out = b;
                3'b010: final_out = ~a + 'b1; // twos complement of a (invert and add 1)
                3'b011: final_out = ~b + 'b1; // twos complement of b (invert and add 1)
                3'b100: final_out = {5'b00000, comp_out}; // concatenate 5zeros with 1bit result
                3'b101: final_out = xor_out;
                3'b110: final_out = adder_out;
                3'b111: final_out = adder_out;
            endcase
        end
    
endmodule
