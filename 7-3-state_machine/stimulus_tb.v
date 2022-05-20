//-----testbench  of tri_gen_tb-----

`timescale 1 ns/10 ps 


module tri_gen_tb;

reg            clk,res;
wire[8:0]      d_out;

tri_gen tri_gen(  
                   .clk(clk),
                   .res(res),
                   .d_out(d_out)
                    );
initial begin
    $dumpfile("test.vcd");
    $dumpvars(0,tri_gen_tb);
     

         clk<=0 ;res<=0;
    #17 res<=1;
    # 200000 $stop;         
end

always #5 clk=~clk;

 
endmodule
