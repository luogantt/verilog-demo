//-----testbench  of UART_RXer-----

`timescale 1 ns/10 ps 


module UART_RXer_tb();


reg            clk,res;
reg[7:0]       data_in;
reg            en_data_in;

wire            TX;

wire            rdy;


UART_RXer  UART_RXer(
                      .clk(clk),
                      .res(res),
                      .data_in(data_in),
                      .en_data_in(en_data_in),
                      .TX(TX),
                      .rdy(rdy)
                  );
initial begin
    $dumpfile("test.vcd");
    $dumpvars(0,UART_RXer_tb);
     

         clk<=0 ;res<=0;data_in<=8'h0a;en_data_in<=0;
    #17 res<=1;
    #30 en_data_in<=1;
    #10 en_data_in<=0;
    #1000 $stop;         

end
always #5 clk<=~clk;

endmodule
