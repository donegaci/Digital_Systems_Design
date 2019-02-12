module ripple_adder_testbench; 
    
    reg [5:0] test_in0, test_in1;
    reg select; // 1 = subtraction, 0 = addition
    wire [5:0] test_out;
    wire test_overflow;
    
    ripple_adder uut (
        .x(test_in0),
        .y(test_in1),
        .sum(test_out),
        .sel(select),
        .overflow(test_overflow)
    );
    
    initial
    begin
        test_in0 = 6'b000001;
        test_in1 = 6'b111111;
        select = 1'b1;
        #200;
        test_in0 = 6'b000011;
        test_in1 = 6'b000010;
        select = 1'b0;
        #200;
        $stop;
    end
endmodule
