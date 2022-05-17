//-----testbench  of m_gen-----

`timescale 1 ns/10 ps 


module m_gen_tb;

reg        clk,res;

wire        y;
//异名例化

m_gen  m_gen (.clk(clk),
          .res(res),
          .y(y));
 
initial begin
    $dumpfile("test.vcd");
    $dumpvars(0,m_gen_tb);
     

         clk<=0 ;res<=0;
    #17 res<=1;
    # 600 $stop;         
end

always #5 clk=~clk;
 
endmodule
