module shiftreg(out,reset,clk,data,select);
	output reg [7:0] out; //output signal
	input [1:0] select;	//Status selection signal
	input [7:0] data;
	input reset,clk;	//reset signal	
	reg CF,temp;
	


	always @(posedge clk or posedge reset)
		begin
		if(reset)		//reset signal
			begin
			out <= data;	
			CF <= 0;
			end
		else 
			begin
			case(select)
				2'b00:			//ROL:Shift left from cycle
					out <= {out[0],out[7:1]};
				//用原CF的值填补空出的位，移出的位再进入CF
				2'b01:		//RCL:Cyclic left shift with carry
					begin
  					temp = out[0];
                    			out = {CF,out[7:1]}; 
                    			CF = temp;
					end
				
				2'b10:		//ROR:Rotate Right
					out = {out[6:0],out[7]};
				2'b11:			//RCR:Rotate Right Through Carry
					begin
	  				temp =out[7];
                    			out = {out[6:0],CF};
                    			CF = temp;
					end
				default:out <= 8'bx;
			endcase
			end	
		end
endmodule  


