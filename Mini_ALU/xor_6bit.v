
module xor_6bit(
    input [5:0] a,
    input [5:0] b,
    output [5:0] xor_result
    );
    
    assign xor_result = a ^ b;
endmodule
