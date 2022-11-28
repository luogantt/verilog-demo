module pad(
    //DIN, pad driver when pad configured as output
    //OEN, pad direction(1-input, o-output)
    input        DIN, OEN ,
    //pull function (00,01-dispull, 10-pullup, 11-pulldown)
    input [1:0]  PULL ,
    inout        PAD ,
    //pad load when pad configured as input
    output reg   DOUT
    );
 
    //input:(not effect pad external input logic), output: DIN->PAD
    assign       PAD = OEN? 'bz : DIN ;
 
    //input:(PAD->DOUT)
    always @(*) begin
        if (OEN == 1) begin //input
            DOUT   = PAD ;
        end
        else begin
            DOUT   = 'bz ;
        end
    end
 
    //use tristate gate in Verilog to realize pull up/down function
    bufif1  puller(PAD, PULL[0], PULL[1]);
 
endmodule
