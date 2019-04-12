module fsm_detector(
    input wire clk, reset,
    input wire sequence,
    output reg tick
    );
    
    // FSM state declarations
    parameter A = 3'b000;
    parameter B = 3'b001;
    parameter C = 3'b010;
    parameter D = 3'b011;
    parameter E = 3'b100;
    
    //signal declaration           
    reg [2:0] state_reg;
    reg [2:0] state_next;
    
    // state register logic
    // asynchrous reset
    always @(posedge clk, posedge reset)
        if(reset)
            state_reg <= A;
        else
            state_reg <= state_next;
    
    //next-state logic and output logic
    always @ *
    begin
        state_next = state_reg; // default state: the same
        tick = 1'b0; // default tick = 0
        case(state_reg)
            A:  if(sequence) // sequence = 1
                    state_next = B;
                // else stay in A
            B:  if (~sequence)
                    state_next = C;
                // else stay in B
            C:  
                if (~sequence)
                    state_next = D;
                else
                    state_next = B;
            D:  
                if(~sequence)
                    state_next = E;
                else
                    state_next = B;
            E:  if(sequence)
                    begin
                        tick = 1'b1;
                        state_next = B;
                    end
                 else
                    state_next = A;
           default: 
                    state_next = A;
        endcase
    end
endmodule
