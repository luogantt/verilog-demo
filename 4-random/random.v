//2022-05-17
//四级伪随机码发生器


`timescale 1 ns/10 ps 
module m_gen (clk,res,y);

input        clk;
input        res;
output        y;
reg[3:0]     d;       //触发器定义成reg变量;

assign       y=d[0]; 

always@(posedge clk or negedge res)

if (~res) begin 
    d<=4'b1111;  
    end
else begin 

   d[2:0]<=d[3:1];  //右移一位
   d[3]<=d[3]+d[0];

end 


endmodule 


