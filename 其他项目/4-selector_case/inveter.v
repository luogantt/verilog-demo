module mux4to1(
    input [1:0]     sel ,
    input [1:0]     p0 ,
    input [1:0]     p1 ,
    input [1:0]     p2 ,
    input [1:0]     p3 ,
    output [1:0]    sout);
 
    reg [1:0]     sout_t ;
    always @(*)
        case(sel)
            2'b00:   begin      
                    sout_t = p0 ;
                end
            2'b01:       sout_t = p1 ;
            2'b10:       sout_t = p2 ;
            default:     sout_t = p3 ;
        endcase
    assign sout = sout_t ;
 
endmodule
