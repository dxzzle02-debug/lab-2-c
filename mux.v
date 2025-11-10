module mux(x, y, s, m);
    input   x, y; 
    input   s;   
    output  m; 
	 
	 
	 
    assign m = s? y : x;
	 
endmodule
