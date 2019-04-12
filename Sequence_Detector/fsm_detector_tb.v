`timescale 1ns / 1ns
module fsm_detector_tb();
    //declerations
    parameter T = 20; //clock period in nanoseconds
    reg clk, reset;
    reg test_input;
    wire test_tick;
    wire [2:0] state;
    
    
    fsm_detector uut(
        .clk(clk),
        .reset(reset),
        .sequence(test_input),
        .tick(test_tick),
        .state_reg(state)
        );
    
     // clock
    // 20 ns clock running forever
    always
    begin
        clk = 1'b1; //high
        #(T/2); // delay half a period
        clk = 1'b0; //low
        #(T/2); // delay half a period
    end
    
    initial
    begin
        reset <= 1'b1;
        test_input <= 1'b0;
        #(2*T); // delay two clock cycle
        
        reset <= 1'b0;
        test_input <= 1'b0;
        #(T); // delay one clock cycle
        test_input <= 1'b0;
        #(T); // delay one clock cycle
        test_input <= 1'b1;
        #(T); // delay one clock cycle
        test_input <= 1'b0;
        #(T); // delay one clock cycle
        test_input <= 1'b0;
        #(T); // delay one clock cycle
        test_input <= 1'b0;
        #(T); // delay one clock cycle
        test_input <= 1'b1;
        #(T); // delay one clock cycle
        test_input <= 1'b1;
        #(T); // delay one clock cycle
        test_input <= 1'b0;
        #(T); // delay one clock cycle
        
        $finish;
        
    end

    
endmodule
