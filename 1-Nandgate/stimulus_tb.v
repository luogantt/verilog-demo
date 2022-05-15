


//-------testbench of nandgate------------
//与非门
//罗干 2022-05-10

`timescale 1ns/10ps

module  nand_gate_tb;

reg   aa;
reg   bb;
wire  yy;


nand_gate nand_gate (
          .A(aa),
          .B(bb),
          .Y(yy)
           );

initial begin
    $dumpfile("test.vcd");
    $dumpvars(0,nand_gate_tb);
        aa<=0;  bb<=0;
    #10 aa<=1;  bb<=0;
    #10 aa<=0;  bb<=1;
    #10 aa<=1;  bb<=1;
    #10 $stop;
end 
endmodule
