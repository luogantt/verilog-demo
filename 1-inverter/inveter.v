//反相起器设计
`timescale 1ns/10ps
module inv(
           A,
           Y
            );
input       A;
output      Y;


assign      Y=~A;

endmodule 
