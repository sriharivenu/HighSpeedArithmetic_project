module pgGen(p, g, ain, bin);
	input [3:0] ain;
	input [3:0] bin;

	output [3:0] p;
	output [3:0] g;
	
	assign g[0] 	= ain[0] && bin[0];
	assign p[0]	= ain[0] || bin[0];

	assign g[1] 	= ain[1] && bin[1];
	assign p[1]	= ain[1] || bin[1];

	assign g[2] 	= ain[2] && bin[2];
	assign p[2]	= ain[2] || bin[2];

	assign g[3] 	= ain[3] && bin[3];
	assign p[3]	= ain[3] || bin[3];

endmodule
