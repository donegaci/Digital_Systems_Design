`timescale 1ns / 1ps
module dff_tb ();

    reg clock, reset;
    reg test_d;
    wire test_q;
    
    d_ff_reset uut(
        .clk(clock),
        .reset(reset),
        .d(test_d),
        .q(test_q)
    );
    
    
    initial
        begin
            clock = 1'b0;
            forever #10 clock = !clock; // clock with 20ns period
        end
     initial
        begin
            reset = 1'b1;
            #45;
            reset = 1'b0;
            #80;
            reset = 1'b1;
            #30;
            reset = 1'b0;
        end
        
    initial
        begin
        // simulate the data wave shown in handout
        test_d = 1'b0;
        #30
        test_d = 1'b1;
        #25;
        test_d = 1'b0;
        #30;
        test_d = 1'b1;
        #100;
        test_d = 1'b0;
        #50;
        
        $stop;
        
        end
endmodule
