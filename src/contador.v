`timescale 1ns / 1ps

module contador#(parameter N = 8)(input osc_clk, input en, input reset, input clk, output reg [N-1:0] count);

reg aux;

always @(posedge osc_clk) begin
	if(reset) aux <= 1;
	else if(clk && aux) begin
		aux <= 0;
		count <= 0;
	end
	else if(en) begin
		if(!clk) aux<= 1;
		count <= count + 1;
	end
end

endmodule
