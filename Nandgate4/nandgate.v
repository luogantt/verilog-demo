`timescale 1ns/10ps
module nand_gate(
               A,
               B,
               Y
                );
input[3:0]         A;
input[3:0]          B;
output[3:0]         Y;
 
assign          Y=~(A&B); //assign组合逻辑赋值语句
                          //先与后非，与非操作，Verilog位操作
 
endmodule