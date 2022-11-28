



`timescale 1ns/1ns

module test ;
    reg [1:0]    sel ;
    wire [1:0]   sout ;

    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0,test);
        sel       = 0 ;
        #10 sel   = 3 ;
        #10 sel   = 1 ;
        #10 sel   = 0 ;
        #10 sel   = 2 ;
    end

    mux4to1 u_mux4to1 (
        .sel    (sel),
        .p0     (2'b00),        //path0 are assigned to 0
        .p1     (2'b01),        //path1 are assigned to 1
        .p2     (2'b10),        //path2 are assigned to 2
        .p3     (2'b11),        //path3 are assigned to 3
        .sout   (sout));

   //finish the simulation
    always begin
        #100;
        if ($time >= 1000) $finish ;
    end

 
endmodule
