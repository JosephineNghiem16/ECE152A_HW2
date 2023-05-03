module ff_reference #(
	parameter WIDTH = 4
) (
	input 			clk, rst,
	input 	logic 	[WIDTH-1:0] data_i,
	output 	logic 	[WIDTH-1:0] data_o
);
  
//D Flip-Flop 1
  logic [WIDTH-1:0] data_d0, data_q0;
//assign data_o = data_q0;
  
always_comb begin : data_set0
	// data_d is set by combinational logic
	data_d0 = data_i;
end
  
// async reset
  always_ff @(posedge clk or posedge rst) begin : data_ff0
	if (rst) begin
		data_q0 <= '0;
	end else begin
		data_q0 <= data_d0;
	end
end
  
// D Flip-Flop 2
logic [WIDTH-1:0] data_d1, data_q1;
//assign data_o = data_q1;
  
always_comb begin: data_set1
  data_d1 = data_q0;
end
  
  always_ff @(posedge clk or posedge rst) begin: data_ff1
    if(rst) begin
      data_q1 <= '0;
    end else begin
      data_q1 <= data_d1;
    end
  end
  
// D Flip-Flop 3
  logic [WIDTH-1:0] data_d2, data_q2;
assign data_o = data_q2;
  
always_comb begin: data_set2
  data_d2 = data_q1;
end
  
  always_ff @(posedge clk or posedge rst) begin: data_ff2
    if(rst) begin
      data_q2 <= '0;
    end else begin
      data_q2 <= data_d2;
    end
  end
  
endmodule
