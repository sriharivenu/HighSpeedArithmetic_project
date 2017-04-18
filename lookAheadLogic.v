module lookAheadLogic(cout, gout, pout, ain, bin, cin0);
	output [2:0] cout;
 	output gout;
	output pout;

	input [3:0] ain;
	input [3:0] bin;
	input cin0;

	wire p0, p1, p2, p3;
	wire g0, g1, g2, g3;
	
	assign g0 	= ain[0] && bin[0];
	assign p0	= ain[0] || bin[0];

	assign g1 	= ain[1] && bin[1];
	assign p1	= ain[1] || bin[1];

	assign g2 	= ain[2] && bin[2];
	assign p2	= ain[2] || bin[2];

	assign g3 	= ain[3] && bin[3];
	assign p3	= ain[3] || bin[3];

	assign cout[0]	= g0 || (p0 && cin0);
	assign cout[1]	= g1 || (p1 && g0) || (p1 && p0 && cin0);
	assign cout[2]	= g2 || (p2 && g1) || (p2 && p1 && g0) || (p2 && p1 && p0 && cin0);

	assign gout	= g3 || (g2 && p3) || (p3 && p2 && g1) || (p3 && p2 && p1 && g0);
	assign pout	= p3 && p2 && p1 && p0;
	
endmodule
