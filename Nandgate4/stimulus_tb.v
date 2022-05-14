//-----testbench  of nand_gate
module nand_gate_tb;
reg[3:0]          aa,bb;
wire[3:0]         yy;
 
//异名例化
nand_gate nand_gate(
                            .A(aa),
                            .B(bb),
                            .Y(yy)
                            );
 
initial begin
                    aa<=4'b0010;bb<=4'b0010;//reg型变量赋值用带箭头的等号
    #10     aa<=4'b0100;bb<=4'b1000;
    #10     aa<=4'b1100;bb<=4'b1111;
    #10     $stop;//调用$stop系统任务
 
end
 
endmodule