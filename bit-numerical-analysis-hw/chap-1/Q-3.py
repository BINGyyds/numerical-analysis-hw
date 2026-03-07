import math
import numpy as np
import matplotlib.pyplot as plt
from decimal import Decimal, getcontext

getcontext().prec = 50

x = np.linspace(-2 * np.pi, 2 * np.pi, 80)

y = np.sin(x)


def taylor_series(x, n):
    result = np.zeros_like(x, dtype=np.float64)
    for i in range(n + 1):
        result += ((-1) ** i) * (x ** (2 * i + 1)) / float(Decimal(math.factorial(2 * i + 1)))
    return result


y_2 = taylor_series(x, 1)
y_5 = taylor_series(x, 5)
y_10 = taylor_series(x, 10)

plt.plot(x, y, label='y=sin(x)', color='blue')
plt.plot(x, y_2, label='y_2', color='green')
plt.plot(x, y_5, label='y_5', color='red', linestyle='--')
plt.plot(x, y_10, label='y_10', color='orange', linestyle='-.')

plt.ylim(-1.5, 1.5)

ax = plt.gca()
ax.spines['left'].set_position('center')
ax.spines['bottom'].set_position('center')

ax.spines['right'].set_color('none')
ax.spines['top'].set_color('none')

ax.xaxis.set_ticks_position('bottom')
ax.yaxis.set_ticks_position('left')

plt.legend()

plt.show()
