module Lab2B(a, b, cin, d1, d0, coutext);

    input  [3:0] a, b;
	 input 		 cin;
    output [7:0] d1, d0;
	 output coutext;

    wire [3:0] s;       
    wire [2:0] c;       
	 wire       gr;
    wire       cout;    
    wire       z;       
    wire [3:0] ca;    
    wire [3:0] m;
	 
	 
    // 4-bit Ripple Carry Adder
    FullAdder FA0 (a[0], b[0], cin,  s[0], c[0]);
    FullAdder FA1 (a[1], b[1], c[0], s[1], c[1]);
    FullAdder FA2 (a[2], b[2], c[1], s[2], c[2]);
    FullAdder FA3 (a[3], b[3], c[2], s[3], cout);

    // Comparator (sum > 9)
    Comparator COMP (s, 4'b1001, gr);
	 
	 assign z = gr | cout;

    // CircuitA Correction
    NewCircuitA NCA(s, ca);

    //Multiplexers
    mux M0 (s[0], ca[0], z, m[0]);
    mux M1 (s[1], ca[1], z, m[1]);
    mux M2 (s[2], ca[2], z, m[2]);
    mux M3 (s[3], ca[3], z, m[3]);
 
    // Display for D1 (1 or 0)
    CircuitB CB(z, d1);

    // Display for D0
    Decoder dec(m, d0);
	 
	 assign coutext = z;

endmodule
