module count_7seg(
    input wire clk, up,
    input wire reset,
    input wire max_tick,
    output wire [3:0] d3, d2, d1, d0
    );

   reg [3:0] d3_reg, d2_reg, d1_reg, d0_reg;
   reg [3:0] d3_next, d2_next, d1_next, d0_next;
   reg stop_count, stop_count_next;

   // body
   // register
   always @(posedge clk, posedge reset)
   if (reset)
      begin
      d3_reg <= 4'b0;
      d2_reg <= 4'b0;
      d1_reg <= 4'b0;
      d0_reg <= 4'b0;
      stop_count <= 1'b0;
      end
   else     
       begin
          d3_reg <= d3_next;
          d2_reg <= d2_next;
          d1_reg <= d1_next;
          d0_reg <= d0_next;
          stop_count <= stop_count_next;
       end


   // 4-digit bcd counter
   always @*
   begin
      // default: keep the previous value
      d0_next = d0_reg;
      d1_next = d1_reg;
      d2_next = d2_reg;
      d3_next = d3_reg;
      
      if (reset)
         begin
            d0_next = 4'b0;
            d1_next = 4'b0;
            d2_next = 4'b0;
            d3_next = 4'b0;
         end
      else if (up && ~stop_count) // is a sequence has been detected and stop count is low
         if (d0_reg != 9)
            d0_next = d0_reg + 1;
         else              // reach XXX9
            begin
               d0_next = 4'b0;
               if (d1_reg != 9)
                  d1_next = d1_reg + 1;
               else       // reach XX99
                  begin
                     d1_next = 4'b0;
                     if (d2_reg != 9)     
                        d2_next = d2_reg + 1;
                     else // reach X999
                        begin
                            d2_next = 4'b0;
                            if (d3_reg != 9)
                                d3_next = d3_next + 1;
//                            else //  reach 9999reset back to 0
//                                begin
//                                    d3_next = 4'b0;
//                                end
                        end


                  end
            end
   end

   // output logic
   assign d0 = d0_reg;
   assign d1 = d1_reg;
   assign d2 = d2_reg;
   assign d3 = d3_reg;
   

endmodule
