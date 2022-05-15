#!/bin/bash
echo "开始编译"

iverilog nandgate.v stimulus_tb.v -o nand

#./invet

echo "编译完成"
vvp -n nand -lxt2
echo "生成波形文件"
cp test.vcd wave.lxt
echo "打开波形文件"
gtkwave wave.lxt

