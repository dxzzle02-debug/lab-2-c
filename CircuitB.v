module CircuitB (
    input  wire z,          
    output [7:0] b      
);
   
	assign b = z? 8'b11111001 : 8'b11000000;
	
endmodule
