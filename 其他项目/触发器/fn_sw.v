//2022-05-15  罗干
//二选一逻辑设计
`timescale 1ns/10ps 

// 2022-1-27 verilog 学习
// D触发器 
 
`timescale 1ns/10ps

module dff1(clk, d, q);

input       clk,d;
output      q;

reg         q; // 由always敏感变量控制的量是reg
always @(posedge clk)  // 只在时钟上升沿改变
begin
   q <= d;
end

endmodule


