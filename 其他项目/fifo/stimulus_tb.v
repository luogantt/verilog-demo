


//-------testbench of nandgate------------
//与非门
//罗干 2022-05-10

`timescale 1ns/10ps

module syn_fifo_tb;
    reg clk, rstn;
    reg wr_en, rd_en;

    wire fifo_full, fifo_empty;

    reg [7 : 0] wr_data;
    wire    [7 : 0] rd_data;
    


    //生成波形
    /*
    initial begin
        $fsdbDumpfile("wave.fsdb");
        $fsdbDumpvars(0, myfifo);
        $fsdbDumpon();
    end
    */

    //例化
    syn_fifo myfifo(
        .clk(clk),
        .rstn(rstn),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .fifo_full(fifo_full),
        .fifo_empty(fifo_empty),
        .wr_data(wr_data),
        .rd_data(rd_data)
    );

    initial begin
    
        $dumpfile("test.vcd");
        $dumpvars(0,syn_fifo_tb);
        rstn = 1;
        wr_en = 0;
        rd_en = 0;

 
        repeat(2) @(negedge clk);  
        rstn = 0;

        @(negedge clk);  
        rstn = 1;

        @(negedge clk);  
        wr_data = {$random}%60;
        wr_en = 1;

        repeat(2) @ (negedge clk);
        wr_data = {$random}%60;

        @(negedge clk);
        wr_en = 0;
        rd_en = 1;

        repeat(4) @ (negedge clk);
        rd_en = 0;
        wr_en = 1;
        wr_data = {$random}%60;

        repeat(5) @ (negedge clk);
        wr_data = {$random}%60;

        repeat(2) @ (negedge clk);
        wr_en = 0;
        rd_en = 1;

        repeat(2) @ (negedge clk);
        rd_en = 0;
        wr_en = 1;
        wr_data = {$random}%60;

        repeat(3) @ (negedge clk);
        wr_en = 0;

        #50 $finish;
    end

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
endmodule




