//2022-05-16  罗干
//补码转换逻辑

`timescale 1 ns/10 ps 
module comp_conv(a,a_comp  );

input [7:0]  a;

output[7:0]  a_comp;

wire[6:0]   b ;//按位取反的幅度位

wire[7:0]   y ;//复数的补码

assign b=~a[6:0];

assign y[6:0]=b+1;

assign y[7]=a[7]; //符号位

assign a_comp =a[7]?y:a;//二选一

endmodule 

