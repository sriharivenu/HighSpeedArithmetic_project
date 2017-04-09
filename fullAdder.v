module fullAdder(sum, cout, ain, bin, cin);
	input ain;
	input bin;
	input cin;
	
	output sum;
	output cout;
	
	wire ha1_sum;
	wire ha1_cout;
	wire ha2_sum;
	wire ha2_cout;

	halfAdder ha1(ha1_sum, ha1_cout, ain, bin);
	halfAdder ha2(ha2_sum, ha2_cout, cin, ha1_sum);
	or (cout, ha2_cout, ha1_cout);

	assign sum 	= ha2_sum;
endmodule
