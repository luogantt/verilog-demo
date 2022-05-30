

`timescale 1 ns/10 ps 
//  ------testbench----
module dff1_tb;

reg   clk,d;
wire  q;

dff1 dff1(
      .clk(clk), 
      .d(d), 
      .q(q)
      );

initial begin

    $dumpfile("test.vcd");
    $dumpvars(0,dff1_tb);
            d<=0;clk<=0; //reg初值
      #100  $stop;
end
always #5  clk = ~clk;
always #10 d <= d+1; 

endmodule

