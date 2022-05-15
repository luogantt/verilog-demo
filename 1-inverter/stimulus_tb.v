


//-------testbench of inv------------

module int_tb;

reg   aa;
wire  yy;
inv inv (
          .A(aa),
          .Y(yy)
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
