import math
import numpy

def func(x):
    return 0.95*(x**3)  - 5.9*(x**2) + 10.9*x - 6

def funcderi1(x):
    return 0.95*3*(x**2) - 5.9*2*x + 10.9

def newtonRaphson(x):
    for i in range (2):
        xA = x - (func(x)/funcderi1(x))
        x = xA
        print(i, "\t", x, "\t", xA)
    print("The highest real root of this function: ")
    return x

def secantMethod(xB, x):
    for i in range (2):
        xA = x - func(x) * ((x - xB)/(func(x) - func(xB)))
        xB = x
        x = xA
        print(i, "\t", x, "\t", xA, "\t", xB)
    print("The highest real root of this function: ")
    return x

print("Using Newton-Raphson method:")
print(newtonRaphson(3.5))
print("\n\nUsing secant method:")
print(secantMethod(2.5, 3.5))
print("\nLe Thanh Phuong Nam - ITITWE19025\n")