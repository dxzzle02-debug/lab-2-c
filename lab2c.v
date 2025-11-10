module lab2c(a,b,cin,d2,d1,d0);
	
	input [7:0] a,b;
	input       cin;
	output[7:0] d2,d1,d0;
	
	wire dblank = 8'b11111111;
	wire cinext;
	wire cout;

	Lab2B first_stage(a[3:0], b[3:0], cin, dblank, d0, cinext);
	Lab2B second_stage(a[7:4], b[7:4], cinext, d2, d1, cout);
	
endmodule
