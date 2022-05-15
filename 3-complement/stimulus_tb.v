//-----testbench  of comp_conv-----

`timescale 1 ns/10 ps 
module comp_conv_tb;
reg[7:0]     a_in;

wire[7:0]     y_out;
 
//异名例化
comp_conv comp_conv(.a(a_in),
                 .a_comp(y_out)  );
 
initial begin
    $dumpfile("test.vcd");
    $dumpvars(0,comp_conv_tb);
     

         a_in<=0 ;
    # 3000 $stop;         
end

always #10 a_in=a_in+1;
 
endmodule
