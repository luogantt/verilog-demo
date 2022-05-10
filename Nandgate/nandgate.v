//与非门设计
`timescale 1ns/10ps

module nand_gate( 
    input A, 
    input B, 
    output Y );
    assign Y=~(A & B);
endmodule

