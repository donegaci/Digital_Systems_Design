module greater2
   (
    input  wire[1:0] a, b,			// a and b are the two 2-bit numbers to compare
    output wire a_greater_b				// single bit output. Should be high if a > b
   );
   
//   // internal signal declaration, used to wire outpus of the 1 bit comparators
//   wire a0 = a[1], a1 = a[0], b0 = b[1], b1=b[0];
   
   assign a_greater_b = (a[1] & ~b[1]) | (a[0] & ~b[1] & ~b[0]) | (a[1] & a[0] & ~b[0]);


endmodule
