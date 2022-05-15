//-----testbench  of fn_sw-----

`timescale 1 ns/10 ps 
module fn_sw_tb;
reg[3:]          absel;
wire         y;
 
//异名例化
fn_sw  fn_sw(
                            .a(absel[0]),
                            .b(absel[1]),
                            .sel(absel[3:2]),
                            .y(y)
                            );
 
initial begin
    $dumpfile("test.vcd");
    $dumpvars(0,fn_sw_tb);
     
          absel<=0;
        #200 $stop;
    end
    alway #10 absel<=absel+1
     
     #10     $stop;//调用$stop系统任务
 
end
 
endmodule
