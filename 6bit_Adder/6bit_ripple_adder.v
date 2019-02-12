module ripple_adder
    (
        // x and y are the 6-bit two's complement numbers to be added
        // sel allows to select between add/subtract
        input wire [5:0] x,
        input wire [5:0] y,
        input wire sel,
    
        // overflow is used to flag overflow in sum output
        // c_out is the MSB carry out from the sum
        // sum is the sum of a and b
        output wire overflow,
        output wire[5:0] sum,
        output wire[6:0] c_out
    );
    
    // Overflow in two's complement addition is defined as
    // XOR of carry_in and carry_out of MSB adder
    assign overflow = c_out[6] ^ c_out[5] ;
    

    // initialise LSB of c_out to 0 (since there is no carry_in on first adder)
    assign c_out[0] = 1'b0;


    
    // Instantiate six seperate FullAdder modules
    FullAdder adder_1(
        .a(x[0]),
        .b(y[0] ^ sel), // this will negate bits if performing subtraction
        .cin(sel), // first cin is sel because is sel=1, must get two's complement, this adds 1
        .s(sum[0]),
        .cout(c_out[1])
    );
    FullAdder adder_2(
        .a(x[1]),
        .b(y[1] ^ sel), // this will negate bits if performing subtraction
        .cin(c_out[1]),
        .s(sum[1]),
        .cout(c_out[2])
    );
    FullAdder adder_3(
        .a(x[2]),
        .b(y[2] ^ sel), // this will negate bits if performing subtractionv
        .cin(c_out[2]),
        .s(sum[2]),
        .cout(c_out[3])
    );
    FullAdder adder_4(
        .a(x[3]),
        .b(y[3] ^ sel), // this will negate bits if performing subtraction
        .cin(c_out[3]),
        .s(sum[3]),
        .cout(c_out[4])
    );
    FullAdder adder_5(
        .a(x[4]),
        .b(y[4] ^ sel), // this will negate bits if performing subtraction
        .cin(c_out[4]),
        .s(sum[4]),
        .cout(c_out[5])
    );
    FullAdder adder_6(
        .a(x[5]),
        .b(y[5] ^ sel), // this will negate bits if performing subtraction
        .cin(c_out[5]),
        .s(sum[5]),
        .cout(c_out[6])
    );
     
    
endmodule
