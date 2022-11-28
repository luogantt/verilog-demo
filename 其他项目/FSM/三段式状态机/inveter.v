//======================================================================
// --- 名称 : FSM_3
// --- 作者 : xianyu_FPGA
// --- 日期 : 2018-12-15
// --- 描述 : 售货机练习，采用三段式状态机
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
reg  [3:0]              state_c             ;
reg  [3:0]              state_n             ;
//---------------------<状态机参数>-------------------------------------
localparam S0           = 4'b0001           ;
localparam S1           = 4'b0010           ;
localparam S2           = 4'b0100           ;
localparam S3           = 4'b1000           ;

//----------------------------------------------------------------------
//--   状态机第1段
//----------------------------------------------------------------------
always @(posedge clk or negedge rst_n)begin
    if(!rst_n)
        state_c <= S0;
    else
        state_c <= state_n;
end

//----------------------------------------------------------------------
//--   状态机第2段
//----------------------------------------------------------------------
always @(*)begin
    case(state_c)
        S0: begin
            if(in==1)
                state_n = S1;
            else if(in==2)
                state_n = S2;
            else
                state_n = state_c;
        end
        S1: begin
            if(in==1)
                state_n = S2;
            else if(in==2)
                state_n = S3;
            else
                state_n = state_c;
        end
        S2: begin
            if(in==1)
                state_n = S3;
            else if(in==2)
                state_n = S0;
            else
                state_n = state_c;
        end
        S3: begin
            if(in==1 || in==2)      // in != 0也行
                state_n = S0;
            else
                state_n = state_c;
        end
        default:state_n = S0;
    endcase
end

//----------------------------------------------------------------------
//--   状态机第3段
//----------------------------------------------------------------------
//找零钱
always @(posedge clk or negedge rst_n)begin
    if(!rst_n)
        out <= 0;
    else if(state_c==S3 && in==2)
        out <= 1;
    else
        out <= 0;
end

//输出脉动
always @(posedge clk or negedge rst_n)begin
    if(rst_n==1'b0)
        out_vld <= 0;
    else if((state_c==S2 && in==2) || (state_c==S3 && in!=0))
        out_vld <= 1;
    else
        out_vld <= 0;
end


endmodule

