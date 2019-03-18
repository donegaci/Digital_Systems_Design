// Listing 4.2
module d_ff_reset
   (
    input wire clk, reset,
    input wire d,
    output reg q
   );

   // body
   always @(negedge clk)
      if (reset)
         q <= 1'b0;
      else
         q <= d;

endmodule