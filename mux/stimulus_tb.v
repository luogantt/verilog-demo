
module t;

    reg   ain ,bin,select;
    reg   clock;
    wire  outw;

    initial 
    
    begin 

    $dumpfile("test.vcd");
    $dumpvars(0,t);
       ain=0;
       bin=0;
       select =0;
       clock =0;
    end


    
    always #50 clock=~clock;
    always @(posedge clock)
          begin
	   # 1ain={$random}%2;
           # 3bin={$random}%2;
          end
          
          always #1000 select=! select;

          muxtwo m(.out(outw),.a(ain),.b(bin),.sl(select));	  


endmodule


