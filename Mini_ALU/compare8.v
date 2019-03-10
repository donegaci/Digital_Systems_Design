module compare8
   (
    input  wire[7:0] a, b,			// a and b are the two 2-bit numbers to compare
    output wire a_geq_b				// single bit output. Should be high if a > b
   );
   
   // internal signal declaration
   // g0 - g3 represent the greater than output for each two bits starting with MSB 
   // e0 - e3 represnt the equal ouptult for each two bits starting with MSB
   wire g0, g1, g2, g3, e0, e1, e2, e3;

  // named instantiation allows us to change order of ports.
   greater2 greater_bit7_6 (.a(a[7:6]), .b(b[7:6]), .a_greater_b(g0));
   greater2 greater_bit5_4 (.a(a[5:4]), .b(b[5:4]), .a_greater_b(g1));
   greater2 greater_bit3_2 (.a(a[3:2]), .b(b[3:2]), .a_greater_b(g2));
   greater2 greater_bit1_0 (.a(a[1:0]), .b(b[1:0]), .a_greater_b(g3));
   
   eq2 eq_bit7_6 (.a(a[7:6]), .b(b[7:6]), .aeqb(e0));
   eq2 eq_bit5_4 (.a(a[5:4]), .b(b[5:4]), .aeqb(e1));
   eq2 eq_bit3_2 (.a(a[3:2]), .b(b[3:2]), .aeqb(e2));
   eq2 eq_bit1_0 (.a(a[1:0]), .b(b[1:0]), .aeqb(e3));
   
 
   assign a_geq_b = g0 | (e0 && g1) | (e0 && e1 && g2) | (e0 && e1 && e2 && g3) | | (e0 && e1 && e2 && e3);


endmodule
