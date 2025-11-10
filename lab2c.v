module lab2c(a, b, cin, d2, d1, d0);

    input  [7:0] a, b;
	 input        cin;
    output [7:0] d2, d1, d0;

	 
    wire [3:0] s1,s2;       
    wire [5:0] c;              
    wire [3:0] ca1,ca2;    
    wire [7:0] m1, m2; 
	 wire       gr1,gr2;
    wire       cout1,cout2;
    wire       z1,z2;
	 
	 assign z1 = gr1 | cout1;
	 assign z2 = gr2 | cout2;
	 
    //Ripple Carry Adder
    FullAdder FA0 (a[0], b[0], cin,  s1[0], c[0]);
    FullAdder FA1 (a[1], b[1], c[0], s1[1], c[1]);
    FullAdder FA2 (a[2], b[2], c[1], s1[2], c[2]);
    FullAdder FA3 (a[3], b[3], c[2], s1[3], cout1);
	 FullAdder FA4 (a[4], b[4], z1,   s2[0], c[3]);
    FullAdder FA5 (a[5], b[5], c[3], s2[1], c[4]);
    FullAdder FA6 (a[6], b[6], c[4], s2[2], c[5]);
    FullAdder FA7 (a[7], b[7], c[5], s2[3], cout2);


    // Comparator (sum > 9)
    Comparator COMP0 (s1, 4'b1001, gr1);
    Comparator COMP1 (s2, 4'b1001, gr2);
	

    // CircuitA 
	NewCircuitA NCA1(s1, ca1);
	NewCircuitA NCA2(s2, ca2);
	
    //Multiplexers
    mux M0 (s1[0], ca1[0], z1, m1[0]);
    mux M1 (s1[1], ca1[1], z1, m1[1]);
    mux M2 (s1[2], ca1[2], z1, m1[2]);
    mux M3 (s1[3], ca1[3], z1, m1[3]);
	 mux M4 (s2[0], ca2[0], z2, m2[0]);
    mux M5 (s2[1], ca2[1], z2, m2[1]);
    mux M6 (s2[2], ca2[2], z2, m2[2]);
    mux M7 (s2[3], ca2[3], z2, m2[3]);

    // Display for D2 
    CircuitB CB(z2, d2);
	 
	 // Display for D0
	 Decoder dec1(m2, d1);

    // Display for D0
    Decoder dec0(m1, d0);

endmodule


