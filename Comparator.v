module Comparator (a,b,n);
    input [3:0] a,b;
    output n;

   assign n = (a>b)? 1:0;
		
endmodule
