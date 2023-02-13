module coder
(input wire [3:0] data,
input wire [3:0] data2,
output wire [6:0] seg,
output wire [6:0] seg2);
reg [6:0]code;
assign seg=code;
reg [6:0]code2;
assign seg2=code2;
always @* begin
case(data)
	4'b0000: code = 7'b1000000;
	4'b0001: code = 7'b1111001;
	4'b0010: code = 7'b0100100;
	4'b0011: code = 7'b0110000;
	4'b0100: code = 7'b0011001;
	4'b0101: code = 7'b0010010;
	4'b0110: code = 7'b0000010;
	4'b0111: code = 7'b1111000;
	
	4'b1000: code = 7'b1110111;
	4'b1001: code = 7'b1111110;
	4'b1011: code = 7'b1111111;
	4'b1010: code = 7'b0101011;
	4'b1111: code = 7'b1000010;
	
endcase
case(data2)
	4'b0000: code2 = 7'b1000000;
	4'b0001: code2 = 7'b1111001;
	4'b0010: code2 = 7'b0100100;
	4'b0011: code2 = 7'b0110000;
	4'b0100: code2 = 7'b0011001;
	4'b0101: code2 = 7'b0010010;
	4'b0110: code2 = 7'b0000010;
	4'b0111: code2 = 7'b1111000;
	
	4'b1000: code2 = 7'b1110111;
	4'b1001: code2 = 7'b1111110;
	4'b1011: code2 = 7'b1111111;
	4'b1010: code2 = 7'b0101011;
	4'b1111: code2 = 7'b1000010;
endcase
end
endmodule
