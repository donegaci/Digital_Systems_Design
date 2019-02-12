module ripple_adder_testbench; 
    
    reg [5:0] test_in0, test_in1;
    wire [5:0] test_out;
    
    ripple_adder uut (
        .x(test_in0),
        .y(test_in1),
        .sum(test_out)
    );
    
    initial
    begin
        test_in0 = 6'b000001;
        test_in1 = 6'b000000;
        #200;
        test_in0 = 6'b000001;
        test_in1 = 6'b000001;
        #200;
        $stop;
    end
endmodule
