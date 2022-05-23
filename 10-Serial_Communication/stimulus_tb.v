//-----testbench  of UART_top-----

`timescale 1 ns/10 ps 


module UART_top_tb();


reg            clk,res;
wire           RX;

wire           TX;
wire           rdy;

reg[45:0]      RX_send;//里面装有串口字节发送数据;

assign         RX=RX_send[0];

reg[12:0]      con;


UART_top UART_top(

                 .clk(clk),
                 .res(res),
                 .RX(RX),
                 .TX(TX)
);
initial begin
    $dumpfile("test.vcd");
    $dumpvars(0,UART_top_tb);
     

         clk<=0 ;res<=0;RX_send<={1'b1,8'h09,1'b0,1'b1,8'h06,1'b0,1'b1,8'h0a,1'b0,16'hffff};
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
        RX_send[44:0] <=RX_send[45:1];
        RX_send[45] <=RX_send[0];
        end 


end 
endmodule
