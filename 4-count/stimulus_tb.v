//-----testbench  of count-----

`timescale 1 ns/10 ps 
module comp_conv_tb;

reg        clk,res;

wire[7:0]  y;
//异名例化
con  con (.clk(clk),
          .res(res),
          .y(y));
 
initial begin
    $dumpfile("test.vcd");
    $dumpvars(0,comp_conv_tb);
     

         clk<=0 ;res<=0;
    #17 res<=1;
    # 6000 $stop;         
end

always #5 clk=~clk;
 
endmodule
