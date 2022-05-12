//-----testbench  of nand_gate
module nand_gate_tb;
reg          aa,bb;
wire         yy;
 
//异名例化
nand_gate nand_gate(
                            .A(aa),
                            .B(bb),
                            .Y(yy)
                            );
 
initial begin
                    aa<=0;bb<=0;//reg型变量赋值用带箭头的等号
    #10     aa<=0;bb<=0;
    #10     aa<=0;bb<=0;
    #10     aa<=0;bb<=0;
    #10     $stop;//调用$stop系统任务
 
end
 
endmodule