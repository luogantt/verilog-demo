`timescale 1ns/1ns
 
module test ;
    reg          DIN, OEN ;
    reg [1:0]    PULL ;
    wire         PAD ;
    wire         DOUT ;
 
    reg          PAD_REG ;
    assign       PAD = OEN ? PAD_REG : 1'bz ; //
 
    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0,test);
        PAD_REG   = 1'bz ;        //pad with no dirve at first
        OEN       = 1'b1 ;        //input simulation
        #0 ;      PULL      = 2'b10 ;   //pull down
        #20 ;     PULL      = 2'b11 ;   //pull up
        #20 ;     PULL      = 2'b00 ;   //dispull
        #20 ;     PAD_REG   = 1'b0 ;
        #20 ;     PAD_REG   = 1'b1 ;
 
        #30 ;     OEN       = 1'b0 ;    //output simulation
                  DIN       = 1'bz ;
        #15 ;     DIN       = 1'b0 ;
        #15 ;     DIN       = 1'b1 ;
    end
 
    pad     u_pad(
        .DIN     (DIN) ,
        .OEN     (OEN) ,
        .PULL    (PULL) ,
        .PAD     (PAD) ,
        .DOUT    (DOUT)
    );
 
    initial begin
        forever begin
            #100;
            if ($time >= 1000)  $finish ;
        end
    end
 
endmodule // test
