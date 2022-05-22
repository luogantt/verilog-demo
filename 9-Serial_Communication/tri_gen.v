//2022-05-22 ,罗干
//串口通信;

`timescale 1ns/10ps
module  UART_RXer(
                 clk,
		             res,           
                 data_in,
                 en_data_in,
                 TX,
                 rdy
                  );

input            clk;
input            res;
input[7:0]       data_in;     //准备发送的数据
input            en_data_in;  //发送使能


output           rdy;         //空闲标志 0表示空闲
output           TX;  // 输出使能


reg[3:0]         state ;       //主状态机寄存器
reg[10:0]        send_buf;     //发送寄存器

reg[12:0]        con;          //用于计算波特周期;




//reg[3:0]         con_bits ;    //用于计算比特数
//reg              RX_delay;    // RX 的延时
//reg              en_data_out;

assign            TX=send_buf[0]; //连接TX

reg[9:0]           send_flag; //用于判断右移结束;

reg                rdy;



always@(posedge clk or negedge res )


   if (~res )begin 
   state<=0; send_buf<=0;con<=0;send_flag<= 10'b10_0000_0000;

   rdy<=0;

   //con<=0;con_bits<=0; RX_delay<=0;
   //data_out<=0;en_data_out<=0;
   end

   else begin 

      //RX_delay <=RX;

      case(state)

      0://等空闲
        begin 
        if (en_data_in)begin

            send_buf={1'b1,data_in,1'b0} ;
            send_flag<= 10'b10_0000_0000;
            rdy<=1;
            state<=1; 
            end 
  
        end 


      1://串口发送,寄存器右移
        begin 
            if (con==5000-1)begin 
                  con<=0;
                  //state<=3;
                  end
            else begin 
                 con<=con+1;
                 end

            if (con==0)begin 
                send_buf[8:0]<=send_buf[9:1];
                send_flag[8:0]<=send_flag[9:1];
            end

            if (send_flag[0]) begin 
                
                rdy<=0;
                state<=0;

            end 
        end 




        endcase
   end

endmodule
