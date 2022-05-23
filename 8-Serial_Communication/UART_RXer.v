//2022-05-21 ,罗干
//串口通信;

`timescale 1ns/10ps
module  UART_RXer(
                 clk,
		           res,
                 RX,
                 data_out,
                 en_data_out
                  );

input            clk;
input            res;
input            RX;

output[7:0]      data_out;     //接收字节输出  
output           en_data_out;  // 输出使能

reg[7:0]         data_out;
reg[7:0]         state ;       //主状态机

reg[12:0]        con;         //用于计算比特宽度

reg[3:0]         con_bits ;    //用于计算比特数

reg              RX_delay;    // RX 的延时

reg              en_data_out;

always@(posedge clk or negedge res )


   if (~res )begin 
   state<=0; con<=0;con_bits<=0; RX_delay<=0;
   data_out<=0;en_data_out<=0;
   end

   else begin 

      RX_delay <=RX;

      case(state)

      0://等空闲
        begin 
        if (con==4999)begin
            con<=0; 
            end 
        else begin 
            con<=con+1; 
            end 
        
        if(con==0) begin
           if (RX) begin 
               con_bits<=con_bits+1;
               end
            else begin 
               con_bits<=0;
               end


         if (con_bits==12)begin 
            state<=1;
            end 
        end
        end 

      1://等起始位
        begin 
        
        if (~RX & RX_delay)begin 
            state<=2;
            end
        end

      2: //收最低位b0;
        begin 
        if (con==7500-1)begin 
              con<=0;

              data_out[0]<=RX;
              state<=3;
              end
        else begin 
             con<=con+1;
             end
        end 

        3: //收最低位b1;
        begin 
          if (con==5000-1)begin 
              con<=0;

              data_out[1]<=RX;
              state<=4;
              end
          else begin 
             con<=con+1;
             end
        end


       4: //收最低位b2;
        begin 
          if (con==5000-1)begin 
              con<=0;

              data_out[2]<=RX;
              state<=5;
              end
          else begin 
             con<=con+1;
             end
        end

        5: //收最低位b3;
        begin 
          if (con==5000-1)begin 
              con<=0;

              data_out[3]<=RX;
              state<=6;
              end
          else begin 
             con<=con+1;
             end
        end


        6: //收最低位b4;
        begin 
          if (con==5000-1)begin 
              con<=0;

              data_out[4]<=RX;
              state<=7;
              end
          else begin 
             con<=con+1;
             end
        end


        7: //收最低位b5;
        begin 
          if (con==5000-1)begin 
              con<=0;

              data_out[5]<=RX;
              state<=8;
              end
          else begin 
             con<=con+1;
             end
        end

        8: //收最低位b6;
        begin 
          if (con==5000-1)begin 
              con<=0;

              data_out[6]<=RX;
              state<=9;
              end
          else begin 
             con<=con+1;
             end
        end


        9: //收最低位b7;
        begin 
          if (con==5000-1)begin 
              con<=0;

              data_out[7]<=RX;
              state<=10;
              end
          else begin 
             con<=con+1;
             end
        end

        10://产生使能脉冲
        begin
          en_data_out<=1;
          state<=1;
        end 

        default:
        begin 
           state<=0;
           con<=0;
           con_bits<=0;
           en_data_out<=0;

        end


        endcase
   end

endmodule
