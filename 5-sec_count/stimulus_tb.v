//-----testbench  of s_counter-----

`timescale 1 ns/10 ps 


module m_gen_tb;

reg        clk,res;

wire[3:0]        s_num;

s_counter s_counter( .clk(clk),
                     .res(res),
                     .s_num(s_num));
initial begin
    $dumpfile("test.vcd");
    $dumpvars(0,m_gen_tb);
     

         clk<=0 ;res<=0;
    #17 res<=1;
    # 10000000 $stop;         
end

always #5 clk=~clk;
 
endmodule
