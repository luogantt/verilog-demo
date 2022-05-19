#!/bin/bash
echo "开始编译"

iverilog sigma16p.v stimulus_tb.v -o fn

#./invet

echo "编译完成"
vvp -n fn -lxt2
echo "生成波形文件"
cp test.vcd wave.lxt
echo "打开波形文件"
gtkwave wave.lxt

