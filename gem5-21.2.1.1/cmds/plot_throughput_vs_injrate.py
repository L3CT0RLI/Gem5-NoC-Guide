import matplotlib.pyplot as plt

# 读取注入率
injection_rates = []
with open('rates.txt', 'r') as file:
    for line in file:
        stripped_line = line.strip()
        if stripped_line:  # 检查行不是空的
            injection_rates.append(float(stripped_line))

# 读取延迟
latencies = []
with open('ascon_throughput', 'r') as file:
    for line in file:
        stripped_line = line.strip()
        if stripped_line:  # 检查行不是空的
            latencies.append(float(stripped_line))

# 确保注入率和延迟长度一致
if len(injection_rates) != len(latencies):
    print("注入率和throughput数量不一致，请检查数据。")
else:
    # 绘制图形
    plt.figure(figsize=(10, 6))
    plt.plot(injection_rates, latencies, marker='o', linestyle='-')
    plt.title('Average Throughput vs Injection Rate')
    plt.xlabel('Injection Rate')
    plt.ylabel('Average Throughput (units)')
    plt.grid(True)
    plt.xticks(injection_rates)  # 确保 X 轴显示所有注入率
    plt.savefig('throughput_vs_injection_rate1.png')  # 保存图像
    plt.show()  # 显示图像

