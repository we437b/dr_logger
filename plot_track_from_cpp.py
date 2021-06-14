import numpy as np
import matplotlib.pyplot as plt

x_data = np.loadtxt('deepracer_c_x.txt',delimiter=',')
y_data = np.loadtxt('deepracer_c_y.txt',delimiter=',')

plt.figure()
plt.scatter(x_data,y_data)
plt.show()