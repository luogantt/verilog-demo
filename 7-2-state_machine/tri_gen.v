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



reg[2:0]             state ; 

reg[8:0]        d_out;

reg[7:0]        con; //计数器,记录平顶周期个数

always@(posedge clk or negedge res )


   if (~res )begin 
   state<=0;d_out<=0; con<=0;
   end

   else begin 

      case(state)

      0://上升
        begin 
        d_out<=d_out+1; 
        
        if(d_out==299) begin
           state <=1;
           end
        end

      1://平顶
        begin 
        con<=con+1; 
        
        if(con==200) begin
           state <=2;
           con<=0;
           end
         else begin 
           con<=con+1;
           end
        end

      2://下降
        begin 
        d_out<=d_out-1;
        
        if (d_out==1)begin 
            state<=0;
            end
        end

        default:
        begin 
         
        state =0;
        con=0;
        d_out<=0; 
        end 
        endcase
   end

endmodule
