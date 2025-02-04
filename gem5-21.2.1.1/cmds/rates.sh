#!/bin/bash

rates=(0.01 0.02 0.03 0.04 0.05 0.06 0.07 0.08  0.09 0.10 0.11 0.12 0.13 0.14 0.15 0.16 0.17 0.18 0.19 0.20) 

sim_cycles=150000
num_cpus=64
# 清空文件的方式创建或清空输出文件
: > network_stats.txt
: > ascon_latency
: > ascon_throughput
: > rates.txt  # 也清空 rates.txt 文件

for i in ${rates[@]}
do
    echo $i >> rates.txt  # 将当前注入率写入 rates.txt

    ../build/NULL/gem5.opt --debug-flag=GarnetSyntheticTraffic ../configs/example/garnet_synth_traffic.py  \
        --num-cpus=$num_cpus \
        --num-dirs=64 \
        --network=garnet \
        --topology=Mesh_XY \
        --mesh-rows=8  \
        --sim-cycles=$sim_cycles \
        --synthetic=uniform_random \
        --injectionrate=$i \
        --inj-vnet=2 \
        --routing-algorithm=1 

    bash extract.sh
done

# 从 network_stats.txt 提取平均延迟和接收到的 flits
cat network_stats.txt | grep "average_flit_latency" | awk '{print $2}' >> ascon_latency
cat network_stats.txt | grep "flits_received::total" | awk '{print $2}' >> ascon_throughput

# 处理 ascon_throughput，每个吞吐量除以模拟周期和 CPU 数量

# 创建一个临时文件以存储新的吞吐量值
temp_throughput=$(mktemp)

# 逐行读取 ascon_throughput 文件
while read -r line; do
    # 检查 line 是否为有效数字
    if [[ $line =~ ^[0-9]+([.][0-9]+)?$ ]]; then
        # 计算新的吞吐量值
        new_throughput=$(echo "scale=10; $line / $sim_cycles / $num_cpus" | bc -l)
        echo $new_throughput >> "$temp_throughput"
    else
        echo "Warning: Invalid throughput value '$line'. Skipping..."
    fi
done < ascon_throughput

# 用新的吞吐量值替换原始文件
mv "$temp_throughput" ascon_throughput

##python3 plot_lat_vs_injrate.py
##python3 plot_throughput_vs_injrate.py 

