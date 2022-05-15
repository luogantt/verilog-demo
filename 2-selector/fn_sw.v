//2022-05-15  罗干
//二选一逻辑设计
`timescale 1ns/10ps 


module fn_sw(a,b,sel,y);


input  a,b,sel;
output y;

assign y=sel?(a^b):(a&b);
endmodule 
