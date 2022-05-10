


//-------testbench of inv------------

module int_tb;

reg   aa;
reg   bb;
wire  yy;
top_module top_module (
          .a(aa),
          .b(bb),
          .out(yy)
           );

initial begin
    $dumpfile("test.vcd");
     $dumpvars(0,int_tb);
        aa<=0;
    #10 aa<=1;
    #10 aa<=0;
    #10 aa<=1;
    #10 $stop;
end 
endmodule
