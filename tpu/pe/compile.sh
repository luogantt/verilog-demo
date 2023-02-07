#!/bin/bash
echo "开始编译"

iverilog PE.v pe_testbench.v -o mux

#./invet



echo "编译完成"
#vvp -n mux -lxt2

gtkwave test.vcd 
#echo "生成波形文件"
#cp test.vcd wave.lxt
#echo "打开波形文件"
#gtkwave wave.lxt

