module NewCircuitA (
    input [3:0] s,
    output reg [3:0] a
);

    always @(*) begin
        case (s)
			4'b1010: a = 4'b0000; 
            4'b1011: a = 4'b0001; 
            4'b1100: a = 4'b0010;  
            4'b1101: a = 4'b0011;  
            4'b1110: a = 4'b0100;  
            4'b1111: a = 4'b0101;
			4'b0000: a = 4'b0110;
			4'b0001: a = 4'b0111;
			4'b0010: a = 4'b1000;
			4'b0011: a = 4'b1001;
			default: a = s;
          
				
    endcase
    end

endmodule
