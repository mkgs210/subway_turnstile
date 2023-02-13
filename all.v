module all
#(parameter N=4,M=4'd2)
(
input [3:0] a,
input flag,
input clk,
input reset,
output [6:0] hex,
output [6:0] hex2
);

wire [3:0] mooreDoCoder;
wire [3:0] mooreDoCoder2;
wire countDoMoore;
wire [N-1:0] q;

count_div2 block_1(.clk(clk), .sync(countDoMoore), .q(q));

moore_lab block_2 (.clk(countDoMoore), 
.flag(flag), 
.reset(reset), 
.a(a), 
.out(mooreDoCoder [3:0]),
.out2(mooreDoCoder2 [3:0]));

coder block_3(.data(mooreDoCoder [3:0]), 
.data2(mooreDoCoder2 [3:0]), 
.seg(hex), .seg2(hex2));

endmodule
