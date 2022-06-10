import math as m #import lib
import numpy as np
import matplotlib.pyplot as plt
import timeit
from matplotlib.pyplot import figure
# %matplotlib inline

def euler_implicit_200000y(f_prime, y_0, endpoints, h): # define the implicit Euler method
    n = int((endpoints[-1] - endpoints[0])/h)
    x = endpoints[0]
    y = y_0
    x_out, y_out = np.array([x]), np.array([y])
    for i in range(n):
        y_prime = f_prime(x, y)/(1 + h * 200000)
        y += h * y_prime
        x += h
        x_out = np.append(x_out, x)
        y_out = np.append(y_out, y)

    return x_out, y_out

def diff(x, y): # define the Differential Equation Function 
  return -200000 * y + 200000*np.exp(-x) - np.exp(-x)

def f(x): # define the Analytical Solution Function 
  return (2.71828)**(-200000*x)+2.71828**(-x)

#Set time and Solve the Implicit Euler Method
starttime = timeit.default_timer()
x_euler, y_euler = euler_implicit_200000y(diff, 0, (0, 2.1), 0.1) #set x = 0 to 2, y(0) = 0 and step size = 0.1 
y_euler = np.delete(y_euler, 1)
x_euler = np.delete(x_euler, -1)
print(x_euler)
print (y_euler)
#plot the implicit Euler method 
plt.title("The Implicit Euler Numerical Solution")
plt.plot(x_euler, y_euler, c="orange", label ="Numerical")
plt.legend()
plt.show()
print("The runtime of The Implicit Euler Numerical Solution is : ", timeit.default_timer() - starttime, 'second.')
#Set time and Solve the Analytical Solution
starttime1 = timeit.default_timer()
x = np.arange(0, 2.1, 0.1) #set x = 0 to 2 and step size = 0.1
y = f(x)
y[0] = 0 #y(0) = 0
print(x)
print(y)
#plot the Analytical Solution 
plt.title("Analytical Solution")
plt.plot(x, y, c="green", label ="Analytical")
plt.legend()
plt.show()
print("The runtime of Analytical Solution is : ", timeit.default_timer() - starttime1, 'second.')
#Assessment:
#The runtime of Numerical is faster Solution than Analytical Solution
#The Graphs of Numerical and Analytical Solution are identical
