import math
import numpy


def functionY(x, y):
    return -(x ** 2) + x + 0.75

def functionX(x, y):
    return (x ** 2 - y) / (5 * y)


def u(x, y):
    return y + x * x -x - 0.75


def v(x, y):
    return y + 5 * x * y - x * x

def udx(x, y):
    return 2 * x - 1

def udy(x, y):
    return 1

def vdx(x, y):
    return 5 * y - 2 * x

def vdy(x, y):
    return 1 + 5 * x

def fixedPoint(x, y):
    i = 0
    while i < 7:
        x = functionX(x, y)
        y = functionY(x, y)
        i += 1
        print(i, "\t", x, "\t", y)
    return x, y


def newtonRaphson(x1, y1):
    for i in range(20):
        x2 = x1 - (u(x1, y1) * vdy(x1, y1) - v(x1, y1) * udy(x1, y1)) / (udx(x1, y1) * vdy(x1, y1) - udy(x1, y1) * vdx(x1, y1))
        y2 = y1 - (v(x1, y1) * udx(x1, y1) - u(x1, y1) * vdx(x1, y1)) / (udx(x1, y1) * vdy(x1, y1) - udy(x1, y1) * vdx(x1, y1))

        eax = (x2 - x1) / x2
        eay = (y2 - y1) / y2
        x1 = x2
        y1 = y2
        if abs(eax) < 0.001 and abs(eay) < 0.001:
           break
        print(i, "\t", x1, "\t", y1, "\t", eax, "\t", eay)
    return x1, y1


print("\nUsing fixed-point iteration")
print("%5s %14.7s %15.7s" % ("Iteration", "xi", "yi"))
print(fixedPoint(1.2, 1.2))

print("\nUsing Newton-Raphson method")
print("%5s %10s %20s %33s %23s" % ("Iteration", "xi", "yi", "RelaApproxErrorX", "RelaApproxErrorY"))
print(newtonRaphson(1.2, 1.2))

print("\nLe Thanh Phuong Nam - ITITWE19025\n")
