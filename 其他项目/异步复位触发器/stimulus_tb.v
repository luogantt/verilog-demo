

`timescale 1 ns/10 ps 


//  ------testbench----
module dff2_tb;

reg   clk,res,en,d;
wire  q;

dff2 dff2(
      .clk(clk), 
      .res(res),
      .en(en),
      .d(d), 
      .q(q)
      );

initial begin

             $dumpfile("test.vcd");
             $dumpvars(0,dff2_tb);
            d<=0;clk<=0;res<=0;en<=0; //reg初值
      #23       res<=1; 
      #9      en<=1;
      #100  $stop;
end
always #2   clk = ~clk;
always #10 d <= d+1; 

endmodule
