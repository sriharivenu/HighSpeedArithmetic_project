module lookAheadLogic(cout, gout, pout, p, g, cin0);
	output [2:0] cout;
 	output gout;
	output pout;

	input cin0;
	input [3:0] p;
	input [3:0] g; 

	assign cout[0]	= g[0] || (p[0] && cin0);
	assign cout[1]	= g[0] || (p[1] && g[0]) || (p[1] && p[0] && cin0);
	assign cout[2]	= g[2] || (p[2] && g[1]) || (p[2] && p[1] && g[0]) || (p[2] && p[1] && p[0] && cin0);

	assign gout	= g[3] || (g[2] && p[3]) || (p[3] && p[2] && g[1]) || (p[3] && p[2] && p[1] && g[0]);
	assign pout	= p[3] && p[2] && p[1] && p[0];
	
endmodule
