module lookAheadLogic(cout1, cout2, cout3, gout, pout, ain0, bin0, ain1, bin1, ain2, bin2, ain3, bin3, cin0);
	
	input ain0, ain1, ain2, ain3;
	input bin0, bin1, bin2, bin3;
	input cin0;

	output cout1, cout2, cout3;
	output gout, pout;

	wire p0, p1, p2, p3;
	wire g0, g1, g2, g3;
	
	assign g0 	= ain0 && bin0;
	assign p0	= ain0 || bin0;

	assign g1 	= ain1 && bin1;
	assign p1	= ain1 || bin1;

	assign g2 	= ain2 && bin2;
	assign p2	= ain2 || bin2;

	assign g3 	= ain3 && bin3;
	assign p3	= ain3 || bin3;

	assign cout1	= g0 || (p0 && cin0);
	assign cout2	= g1 || (p1 && g0) || (p1 && p0 && cin0);
	assign cout3	= g2 || (p2 && g1) || (p2 && p1 && g0) || (p2 && p1 && p0 && cin0);

	assign gout	= g3 || (g2 && p3) || (p3 && p2 && g1) || (p3 && p2 && p1 && g0);
	assign pout	= p3 && p2 && p1 && p0;
	
endmodule
