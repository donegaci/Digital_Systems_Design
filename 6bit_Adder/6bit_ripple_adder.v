module ripple_adder
    (
        // x and y are the 6-bit two's complement numbers to be added
        // sel allows to select between add/subtract
        input wire[5:0] x,
        input wire[5:0] y,
        input wire sel,
    
        // overflow is used to flag overflow in sum output
        // c_out is the MSB carry out from the sum
        // sum is the sum of a and b
        output wire overflow, c_out,
        output wire[5:0] sum
    );
    
    // initialise c_out to 0
    assign c_init = 1'b0;
   // assign sum = 6'b0;
    
    FullAdder adder_1(
        .a(x[0]),
        .b(y[0]),
        .cin(c_init),
        .s(sum[0]),
        .cout(c_out)
    );
    FullAdder adder_2(
        .a(x[1]),
        .b(y[1]),
        .cin(c_out),
        .s(sum[1]),
        .cout(c_out)
    );
    FullAdder adder_3(
        .a(x[2]),
        .b(y[2]),
        .cin(c_out),
        .s(sum[2]),
        .cout(c_out)
    );
    FullAdder adder_4(
        .a(x[3]),
        .b(y[3]),
        .cin(c_out),
        .s(sum[3]),
        .cout(c_out)
    );
    FullAdder adder_5(
        .a(x[4]),
        .b(y[4]),
        .cin(c_out),
        .s(sum[4]),
        .cout(c_out)
    );
    FullAdder adder_6(
        .a(x[5]),
        .b(y[5]),
        .cin(c_out),
        .s(sum[5]),
        .cout(c_out)
    );
    
    //concatenate overflow and sum
//    assign sum = {overflow, sum};
    
    
endmodule
