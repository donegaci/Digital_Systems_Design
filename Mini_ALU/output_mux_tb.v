
module output_mux_tb();

    // Internal signals for testing 
    reg [2:0] fxn_code;
    reg [5:0] test_in0, test_in1;
    wire [5:0] test_out;
    reg [5:0] adder_output;
    reg comparator_output;
    reg [5:0] xor_output;
    integer i;
    
    output_mux out_mux(
        .fxn_code(fxn_code),
        .a(test_in0),
        .b(test_in1),
        .adder_out(adder_output),
        .comp_out(comparator_output),
        .xor_out(xor_output),
        .final_out(test_out) 
    );
    
    initial
    begin

        
        for(i=0; i<8; i=i+1 )
            begin
                fxn_code = i;
                test_in0 = 6'b000111;
                test_in1 = 6'b011000;
                adder_output = 6'b011111;
                comparator_output = 'b1;
                xor_output = 6'b011111;
                #100;
            end  
    end

    
    
endmodule
