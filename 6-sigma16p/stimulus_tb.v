//-----testbench  of s_sigma_16p-----

`timescale 1 ns/10 ps 


module sigma_16p_tb;

reg            clk,res;

reg[7:0]       data_in;
reg            syn_in;

wire[11:0]      data_out;
sigma_16p sigma_16p(
                   
                   .clk(clk),
                   .res(res),
                   .data_in(data_in),
                   .syn_in(syn_in),
                   .data_out(data_out),
                   .syn_out(syn_out));
initial begin
    $dumpfile("test.vcd");
    $dumpvars(0,sigma_16p_tb);
     

         clk<=0 ;res<=0;data_in=1;syn_in<=0;
    #17 res<=1;
    # 500 $stop;         
end

always #5 clk=~clk;
always #100 syn_in <=~syn_in;
 
endmodule
