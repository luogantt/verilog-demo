//======================================================================
// --- 名称 : FSM_1
// --- 作者 : xianyu_FPGA
// --- 日期 : 2018-12-15
// --- 描述 : 售货机练习，采用一段式状态机
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
//--   状态机第1段
//----------------------------------------------------------------------
always@(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        state   <= S0;
        out     <= 0 ;
        out_vld <= 0 ;
    end
    else begin
        case(state)
            S0: begin
                if(in==1)begin
                    state   <= S1;
                end
                else if(in==2)begin
                    state   <= S2;
                end
                else begin
                    out     <= 0 ;
                    out_vld <= 0 ;
                end
            end
            S1: begin
                if(in==1)begin
                    state   <= S2;
                end
                else if(in==2)begin
                    state   <= S3;
                end
            end
            S2: begin
                if(in==1)begin
                    state   <= S3;
                end
                else if(in==2)begin
                    state   <= S0;
                    out_vld <= 1 ;
                end
            end
            S3: begin
                if(in==1)begin
                    state   <= S0;
                    out_vld <= 1 ;
                end
                else if(in==2)begin
                    state   <= S0;
                    out     <= 1 ;
                    out_vld <= 1 ;
                end
            end
            default:state   <= S0;
        endcase
    end
end



endmodule

