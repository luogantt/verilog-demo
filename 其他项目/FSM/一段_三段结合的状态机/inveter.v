//======================================================================
// --- 名称 : FSM_V3
// --- 作者 : xianyu_FPGA
// --- 日期 : 2019-06-12
// --- 描述 : 售货机练习，采用V3学院的状态机
//======================================================================

module FSM_3
//---------------------<端口声明>---------------------------------------
(
input                   clk                 ,
input                   rst_n               ,
input      [1:0]        in                  ,
output reg [1:0]        out                 ,
output reg              out_vld
);
//---------------------<信号定义>---------------------------------------
reg  [3:0]              state               ;
//---------------------<状态机参数>-------------------------------------
localparam S0           = 4'b0001           ;
localparam S1           = 4'b0010           ;
localparam S2           = 4'b0100           ;
localparam S3           = 4'b1000           ;

//----------------------------------------------------------------------
//--   状态机
//----------------------------------------------------------------------
always @(posedge clk or negedge rst_n)begin
    if(!rst_n)
        state <= S0;
    else begin
        case(state)
            S0: begin
                if(in==1)
                    state <= S1;
                else if(in==2)
                    state <= S2;
            end
            S1: begin
                if(in==1)
                    state <= S2;
                else if(in==2)
                    state <= S3;
            end
            S2: begin
                if(in==1)
                    state <= S3;
                else if(in==2)
                    state <= S0;
            end
            S3: begin
                if(in==1 || in==2)      // in != 0也行
                    state <= S0;
            end
            default:state <= S0;
        endcase
    end
end

//----------------------------------------------------------------------
//--   输出
//----------------------------------------------------------------------
//找零钱
always @(posedge clk or negedge rst_n)begin
    if(!rst_n)
        out <= 0;
    else if(state==S3 && in==2)
        out <= 1;
    else
        out <= 0;
end

//输出脉动
always @(posedge clk or negedge rst_n)begin
    if(rst_n==1'b0)
        out_vld <= 0;
    else if((state==S2 && in==2) || (state==S3 && in!=0))
        out_vld <= 1;
    else
        out_vld <= 0;
end


endmodule

