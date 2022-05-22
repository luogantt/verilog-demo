//-----testbench  of UART_RXer-----

`timescale 1 ns/10 ps 


module UART_RXer_tb();


reg            clk,res;

wire            RX;
wire[7:0]      data_out;


reg[25:0]      RX_send; //里面装有串口数据

reg[12:0]      con;
assign         RX=RX_send[0];//链接RX


UART_RXer  UART_RXer(
                      .clk(clk),
                      .res(res),
                      .RX(RX),
                      .data_out(data_out),
                      .en_data_out(en_data_out)
                  );
initial begin
    $dumpfile("test.vcd");
    $dumpvars(0,UART_RXer_tb);
     

         clk<=0 ;res<=0;RX_send<={1'b1,8'haa,1'b0,16'hffff};
         con<=0;
    #17 res<=1;
    # 4000000 $stop;         
end

always #5 clk=~clk;


always@(posedge clk )begin 

    if (con==5000-1)begin 
        con<=0;
       end 
       else begin 
           con<=con+1;
       end 
    if (con==0)begin 
        RX_send[24:0] <=RX_send[25:1];
        RX_send[25] <=RX_send[0];
        end 


end 

 
endmodule
