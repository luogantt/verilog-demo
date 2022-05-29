//-----testbench  of fn_sw-----

`timescale 1 ns/10 ps 
module fn_sw_tb;
reg          a,b,sel;
wire         y;
 
//异名例化
fn_sw  fn_sw(
                            .a(a),
                            .b(b),
                            .sel(sel),
                            .y(y)
                            );
 
initial begin
    $dumpfile("test.vcd");
    $dumpvars(0,fn_sw_tb);
     
         
         a<=0 ;b<=0;sel<=1;
     #10 a<=1 ;b<=1;sel<=1;
     #10 a<=0 ;b<=0;sel<=1;
     #10 a<=0 ;b<=1;sel<=0;
     #10 a<=1 ;b<=0;sel<=0;
     #10 a<=1 ;b<=0;sel<=1;
     #10 a<=0 ;b<=1;sel<=1;


     #10 a<=1 ;b<=1;sel<=0;
     
     
     #10     $stop;//调用$stop系统任务
 
end
 
endmodule
