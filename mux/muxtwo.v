`timescale 1ns/10ps
module muxtwo(out,a,b,sl);

input a,b,sl;

output out;

reg out;

    always@(sl or a or b )
	    if (! sl) out=a;
	    else out=b;



endmodule


