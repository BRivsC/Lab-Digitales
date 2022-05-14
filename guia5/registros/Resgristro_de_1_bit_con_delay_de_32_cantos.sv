`timescale 1ns / 1ps
module register_1_bit_delay (
	input logic clk, D, reset, enable,
	output logic Q

	);
	
	logic [31:0] shift_reg;
	
	always_ff @(posedge clk) begin
		if (reset) begin
			shift_reg <= 'b0;
		end else if (enable) begin
			shift_reg <= {shift_reg[30:0], D};
		end else begin
			shift_reg <= shift_reg;
		end
    end
    
    assign Q = shift_reg[31];
	//end
endmodule
		