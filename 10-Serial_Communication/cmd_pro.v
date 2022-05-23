//2022-05-22 ,罗干
//指令处理器;

`timescale 1ns/10ps
module  cmd_pro(
                 clk,
		         res,           
                 din_pro,
                 en_din_pro,
                 dout_pro,
                 en_dout_pro,
                 rdy
                  );

input            clk;
input            res;

input[7:0]       din_pro;    //指令和数据输入端口
input            en_din_pro; //输入使能
output[7:0]      dout_pro;   //指令执行结果
output           en_dout_pro;//指令输出使能
output           rdy;        //串口发送空闲模块标志 0表示空闲
reg              en_dout_pro;


reg[2:0]         state ;     //主状态机寄存器
reg[7:0]         cmd_reg,A_reg,B_reg;//存放指令. A和B
reg[7:0]         dout_pro;


parameter        add_ab=8'h0a;
parameter        sub_ab=8'h0b;
parameter        and_ab=8'h0c;
parameter        or_ab =8'h0d;


always@(posedge clk or negedge res )


   if (~res )begin 
   state<=0; 

   cmd_reg<=0;A_reg<=0;B_reg<=0;dout_pro<=0;
   en_dout_pro<=0;

   end

   else begin 



      case(state)

      0://等收令
        begin 
        en_dout_pro<=0;
        if (en_din_pro)begin

            cmd_reg<=din_pro;
            state<=1; 
            end 
  
        end 


      1://收A
        begin 
            if (en_din_pro)begin 
                   A_reg<=din_pro;
                   state<=2;
                  end
        end 
      2://收B
        begin 
            if (en_din_pro)begin 
                   B_reg<=din_pro;
                   state<=3;
                  end
        end 

      3:// 指令译码和执行
        begin 

            state<=4;
            case(cmd_reg)
            add_ab:begin dout_pro<=A_reg+B_reg;  end
            sub_ab:begin dout_pro<=A_reg-B_reg;  end
            and_ab:begin dout_pro<=A_reg&B_reg;  end
            or_ab:begin  dout_pro<=A_reg|B_reg;  end

            endcase
        end 


        4://发送指令,执行结果;
        begin 
            if (~rdy)begin 
                   en_dout_pro<=1;
                   state<=0;
                  end
        end 

        default://
        begin 
        state <=0;
        en_dout_pro<=0;

        end 

        endcase
   end

endmodule
