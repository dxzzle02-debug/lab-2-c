module Decoder(
input [3:0] c,
output reg [7:0] s
);

always @(*) begin
case (c) 
       4'b0000 : s = 8'b11000000; 
       4'b0001 : s = 8'b11111001; 
       4'b0010 : s = 8'b10100100; 
       4'b0011 : s = 8'b10110000; 
       4'b0100 : s = 8'b10011001; 
       4'b0101 : s = 8'b10010010;
       4'b0110 : s = 8'b10000010; 
       4'b0111 : s = 8'b11111000; 
       4'b1000 : s = 8'b10000000; 
       4'b1001 : s = 8'b10010000;
       default : s = 8'b11111111; 
 
 
endcase
end
 

endmodule
