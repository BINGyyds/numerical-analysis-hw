import pandas as pd
import matplotlib.pyplot as plt

# 1. 读取 C++ 生成的 CSV 数据
df = pd.read_csv("q3_data.csv")
x = df['x']

# 2. 画图配置
plt.plot(x, df['y_true'], label='y=sin(x)', color='blue')
plt.plot(x, df['y_2'], label='y_2', color='green')
plt.plot(x, df['y_5'], label='y_5', color='red', linestyle='--')
plt.plot(x, df['y_10'], label='y_10', color='orange', linestyle='-.')

plt.ylim(-1.5, 1.5)

# 3. 坐标轴美化 (完全照搬你的原代码逻辑)
ax = plt.gca()
ax.spines['left'].set_position('center')
ax.spines['bottom'].set_position('center')
ax.spines['right'].set_color('none')
ax.spines['top'].set_color('none')
ax.xaxis.set_ticks_position('bottom')
ax.yaxis.set_ticks_position('left')

plt.legend()
plt.show()