// Write your modules here!
module muxes(
	input a_i, b_i, c_i, d_i,
	input logic [1:0] sel4_i,
	output logic y0_o, y1_o
);
  
// 2 x 1 mux
  wire s = a_i ^ b_i;
  always_comb begin
    if (s) begin
      y = d_i;
    end else begin
      y = c_i;
    end
  end
assign y0_o = y;
  
// 4 x 1 mux
  always_comb begin
    case (sel4_i)
      0: z = 0;
      1: z = c_i;
      2: z = 0;
      3: z = d_i;
    endcase
  end
assign y1_o = z;

endmodule
