

`timescale 1 ns/10 ps 


//  ------testbench----


module test_shiftreg;
	reg clk_t,reset_t;
	reg[1:0] select_t;
	wire[7:0] out_t;
	reg[7:0] data_t;
	
	shiftreg myshift(
		.out(out_t),
		.reset(reset_t),
		.clk(clk_t),
		.data(data_t),
		.select(select_t));

	initial
	begin    
                $dumpfile("test.vcd");
                $dumpvars(0,myshift);
		data_t = 8'b1011_0101;
		reset_t = 1;
		clk_t = 0;
		select_t = 2'b11;
		#20 reset_t = 0;
	end
	always #20 clk_t = ~clk_t;	//clock signal

endmodule


