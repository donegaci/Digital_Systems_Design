`timescale 1ns / 1ps
module ALU_tb();
    // Internal signals for testing 
    reg [2:0] fxn_code; // 3bit number to determine what function to perform
    reg [5:0] test_in0, test_in1;
    wire [5:0] test_out;
    wire overflow, carry_out;
    
    integer i; // used in for loop for testing
    
    alu uut (
        .input_a(test_in0),
        .input_b(test_in1),
        .fxn(fxn_code),    
        .out(test_out),
        .o_flow(overflow),
        .c_out(carry_out)
    );
    
    initial
    begin
        test_in0 = 6'b000111;
        test_in1 = 6'b111111;
        
        // Loop through each of the eight possible fxn codes
        for(i=0; i<8; i=i+1 )
            begin
                fxn_code = i;
                #100;
            end  
        $stop;
    end


endmodule
