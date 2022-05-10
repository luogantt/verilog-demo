//反相起器设计
`timescale 1ns/10ps

module top_module( 
    input a, 
    input b, 
    output out );
    assign out=a & b;
endmodule

