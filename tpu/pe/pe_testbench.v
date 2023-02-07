`timescale 1ns/10ps

module test_pe();

    reg reset;
    reg clk;

    reg EN;                          // enable signal for the accelerator; high for active
    reg SELECTOR;                    // weight select read or use
    reg W_EN;                         // enable weight to flow
    reg [7:0]active_left;
    reg [15:0]in_sum;
    reg [15:0]in_weight_above;
    wire [15:0]out_sum;
    wire [7:0]active_right;
    wire [7:0]out_weight_below;
    
    

    reg signed[7:0] weight_1; 
    reg signed[7:0] weight_2;

    PE PE(
        .CLK          (clk),
        .RESET        (rest),
        .EN            (EN),
        .SELECTOR      (SELECTOR),
        .W_EN          (W_EN),
        .active_left   (active_left),
        .active_right  (active_right),
        .in_sum        (in_sum),
        .out_sum       (out_sum),
        .in_weight_above (in_weight_above),
        .out_weight_below  (out_weight_below)
        );

    initial begin
    
        $dumpfile("test.vcd");
        $dumpvars(0,test_pe);
        reset = 1;
        clk = 1;
        EN = 1;
        SELECTOR = 1;
        W_EN = 1;
        in_sum = 0;
        #100 reset = 0;
        #50 
        in_weight_above = 1;
        active_left = 6;
        #100 
        SELECTOR = 0;
        in_weight_above = 1;
        active_left = 6;
        #100 
        SELECTOR = 0;
        in_weight_above = 2;
        active_left = 6;
        #100 
        SELECTOR = 0;
        in_weight_above = 2;
        active_left = 7;
    end

    always #50 clk = ~clk;
endmodule
