//2022-05-15  罗干
//二选一逻辑设计
`timescale 1ns/10ps 


module fn_sw(a,b,sel,y);


input  a,b,sel;
output y;

// assign y=sel?(a^b):(a&b);

reg y;
always@(a or b or sel ) 

begin 

case(sel)

2'b00:begin y<=a&b;end
2'b01:begin y<=a|b;end
2'b10:begin y<=a^b;end
2'b11:begin y<=~(a^b);end
endcase

end

endmodule 
