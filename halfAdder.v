module halfAdder(sum, cout, ain, bin);
	input ain;
	input bin;
	output sum;
	output cout;

	wire d;
	wire e;
	wire f;
	
	or (d, ain, bin);
	and (e, ain, bin);
	not (f, e);
	and (sum, d, f);
	
	assign cout = e;
endmodule