module moore_lab
(input clk,
	input flag,
	input reset,
	input [3:0] a,
	output reg [3:0] out,
	output reg [3:0] out2);

reg [2:0] state;
reg [9:0] cnt;
reg [3:0] a0;
reg [3:0] a1;
reg [3:0] a2;
reg [1:0] money;
reg [3:0] four;
integer morefore;
parameter Res = 0, Weit = 1, Card_read_T1= 2, Balance_out = 3, GO = 4;
 
 
initial 
	begin
	 a0 <= a;
	 four <=4'b0100;
	 if (a0>four)
	 morefore <= 1'd1;
	 else morefore<=1'd0;
	end

always @ (posedge clk or posedge reset) begin
	
	//if (morefore==1) begin
	//	money<=1'd1;
		//a0=a0-3'd5;//-5
	//end
	//else
	//	money<=1'd0;


	if (reset)
		state <= Res;
	else begin
	
	begin
	a0 = a;
	end
	begin
		if (a0>four)
		morefore <= 1'd1;
		else 
		morefore <= 1'd0;
	end
	case (state)
		Res:
			state <= Weit;
		Weit:
			if(cnt==10'd400)
				if(flag)
					state <= Card_read_T1;

		Card_read_T1:
			if(cnt==10'd400)
				if(flag)
					state <= Balance_out;

		Balance_out:
			if(cnt==10'd600)
			//вычесть и вывести остаток, если не хватает то не вычитать
				if (morefore==1'd1)//если нормально денег то идем
					begin
					state <= GO;
					end
				else begin
					state <= Weit;
					end
			else
			begin
				if (morefore==1'd1)//если нормально денег то идем
					begin
						if ((a0-3'd5)>4'b0111)
							begin
								a1<=1'd1;
								a2<= a0-3'd5-4'd10;
							end
						else
							begin
								a1<=1'd0;
								a2<=a0-3'd5;
							end
					end
				else begin
					a1<=4'b1010;
					a2<=4'b0000;
					end
			end
		GO:
			if(cnt==10'd800)
				begin
				state <= Weit;
				end
		
		default:
			state <= Weit;
	endcase
	end
end

always @ (posedge clk)
begin
	case (state)
		Res:
			begin
				out <= 4'b1000;
				out2 <= 4'b1011;
				//out <= 3'b000;
			end
		Weit:
			begin
				out <= 4'b1000;
				out2<=4'b1011;
				if (cnt==10'd400)
					begin
					cnt <= 2'd0;
					//out <= 4'b1000;
					//out2 <= 4'b1000;
					end
				else
					cnt <= cnt + 2'd1;
					//out <= 5'b10000;
			end
		Card_read_T1:
			begin
				out <= 4'b1000;
				out2 <= 4'b1000;
				if (cnt==10'd400)
					begin
					cnt <= 2'd0;
					//out <= 4'b1000;
					//out2 <= 4'b1000;
					end
				else
					cnt <= cnt + 2'd1;
			end
		Balance_out:
			begin
				out <= a1;
				out2 <= a2;
				if (cnt==10'd600)
					begin
					cnt <= 2'd0;
					//out <= 4'b1000;
					//out2 <= 4'b1000;
					end
				else
					cnt <= cnt + 2'd1;
					
			end
		GO:
			begin
				out <= 4'b1111;
				out2 <= 4'b0000;
				if (cnt==10'd800)
					begin
					cnt <= 2'd0;
					//out <= 4'b1000;
					//out2 <= 4'b1000;
					end
				else
					cnt <= cnt + 2'd1;
					
			end
	endcase
end
endmodule 

