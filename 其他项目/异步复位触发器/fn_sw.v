// 2022-1-27 verilog 学习
// D触发器 clk res en
 
`timescale 1ns/10ps

module dff2(clk, res, en, d, q);

input    clk;
input    res;
input    en;
input       d;
output      q;

reg q;
always@(posedge clk or posedge res)
   begin
   if(~res)
      begin
         q<=0;
      end
   else begin
      if(en)
      begin
         q <= d;
      end
   end
end

endmodule



