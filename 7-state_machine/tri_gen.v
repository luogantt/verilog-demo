//2022-05-18 ,罗干
//相邻16点相加;

`timescale 1ns/10ps
module tri_gen(
                 clk,
		           res,
                 d_out);

input            clk;
input            res;
output[8:0]      d_out;     



reg             state ; 

reg[8:0]        d_out;



always@(posedge clk or negedge res )


   if (~res )begin 
   state<=0;d_out<=0; 
   end

   else begin 

      case(state)

      0://上升
        begin 
        d_out<=d_out+1; 
        
        if(d_out==299) begin
           state <=1;
           end;
         end


      1://下降
        begin 
        d_out<=d_out-1;
        
        if (d_out==1)begin 
            state<=0;
            end
        end
        endcase
   end

endmodule
