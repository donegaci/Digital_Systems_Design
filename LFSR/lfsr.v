// Linear Feedback Shift Register (LFSR)
module lfsr (
    input wire clk, reset,
    output wire [N-1: 0] lfsr_out,
    output reg max_tick
    );
    
    localparam lfsr_seed = 12'b110000001101; // a seed value
    localparam N = 12; // number of bits in lfsr
    
    //signal declaration
    reg [N-1:0] lfsr_reg; // register storage
    reg [N-1:0] lfsr_next; // next value
    reg lfsr_tap; // to hold feedback
    
    integer cycle_count; // count the number of lfsr cycles
    
    // body
    // register
    always @(posedge clk, posedge reset)
        if (reset)
            begin
                lfsr_reg <= lfsr_seed;
                max_tick <= 1'b0; // reset max_tick
                cycle_count <= 0; // reset cycle counter
            end
        else
            begin
                lfsr_reg <= lfsr_next;
                cycle_count <= cycle_count + 1;
                // max_tick goes high after 2^N -1 cycles
                if (cycle_count == 2**N - 1 )
                    max_tick <= 1'b1;
                else
                    max_tick <= 1'b0;
            end
         
    // next-state logic
    always @*
    begin
        // For 12 bit lfsr, generate the feedback by XOR of tap 0, 3, 5, 11
        lfsr_tap = lfsr_reg[0] ^ lfsr_reg[3] ^ lfsr_reg[5] ^ lfsr_reg[11];
        // feedback goes into 0 position. Other bits shift up
        lfsr_next = {lfsr_reg[10:0],lfsr_tap };
    end 
    // output logic
    assign lfsr_out = lfsr_reg;
    
endmodule