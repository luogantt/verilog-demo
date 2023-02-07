module syn_fifo(clk, rstn, wr_en, rd_en, wr_data, rd_data, fifo_full, fifo_empty);

    //参数定义
    parameter   width = 8;
    parameter   depth = 8;
    parameter   addr  = 3;

    //输入信号
    input   clk;    //时钟信号
    input   rstn;   //下降沿复位
    input   wr_en;  //写入使能
    input   rd_en;  //读取使能

    //数据信号
    input   [width - 1 : 0] wr_data;    //写数据
    output  [width - 1 : 0] rd_data;    //读数据

    reg [width - 1 : 0] rd_data;

    //空满判断信号
    output  fifo_full;
    output  fifo_empty;

    //定义一个计数器，用于判断空满
    reg [$clog2(depth): 0] cnt;

    //定义读写地址
    reg [depth - 1 : 0] wr_ptr;
    reg [depth - 1 : 0] rd_ptr;

    //定义一个宽度为为width，深度为depth的fifo
    reg [width - 1 : 0] fifo [depth - 1 : 0];

    //写地址操作
    always @ (posedge clk or negedge rstn) begin
        if(!rstn)
            wr_ptr <= 0;
        else if(wr_en && !fifo_full)    //写使能，且fifo未写满
            wr_ptr <= wr_ptr + 1;
        else
            wr_ptr <= wr_ptr;
    end

    //读地址操作
    always @ (posedge clk or negedge rstn) begin
        if(!rstn)
            rd_ptr <= 0;
        else if(rd_en && !fifo_empty)   //读使能，且fifo不为空
            rd_ptr <= rd_ptr + 1;
        else
            rd_ptr <= rd_ptr;
    end

    //写数据
    integer i;

    always @ (posedge clk or negedge rstn) begin
        if(!rstn) begin //复位清空fifo
            for(i = 0; i < depth; i = i + 1)
                fifo[i] <= 0;
        end
        else if(wr_en)  //写使能时将数据写入fifo
            fifo[wr_ptr] <= wr_data;
        else    //否则保持
            fifo[wr_ptr] <= fifo[wr_ptr];
    end

    //读数据
    always @ (posedge clk or negedge rstn) begin
        if(!rstn)
            rd_data <= 0;
        else if (rd_en)
            rd_data <= fifo[rd_ptr];    //从fifo中读取数据
        else
            rd_data <= rd_data;
    end

    //辅助计数，用于判断空满
    always @ (posedge clk or negedge rstn) begin
        if(!rstn)
            cnt <= 0;
        else if (wr_en && !rd_en && !fifo_full) //有效的只写入
            cnt <= cnt + 1;
        else if (!wr_en && rd_en && !fifo_empty) //有效的只读取
            cnt <= cnt - 1;
        else 
            cnt <= cnt;
    end

    //空满判断
    assign fifo_full = (cnt == depth)? 1 : 0;
    assign fifo_empty = (cnt == 0) ? 1 : 0;
endmodule
