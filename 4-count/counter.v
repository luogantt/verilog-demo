`timescale 1 ns/10 ps 
module con (clk,res,y);

input        clk;
input        res;
output[7:0]  y;
reg[7:0]     y;       //触发器定义成reg变量;
wire[7:0]    sum;     //+1 运算结果

assign       sum=y+1; //组合逻辑部分

always@(posedge clk or negedge res)

if (~res) begin 
    y<=0;  //res 为低时y寄存器复位
    end
else begin 

   y<=sum;  // y得到sum值,触发器正常工作时候

end 


endmodule 


