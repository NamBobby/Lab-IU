import math

#define the given function
def myFunc(x):
    return 0.95*(x**3)  - 5.9*(x**2) + 10.9*x - 6

#define the given function 1st deravitive
def myFunc1stDeri(x):
    return 0.95*3*(x**2) - 5.9*2*x + 10.9

#define the given function 2nd deravitive
def myFunc2ndDeri(x):
    return 0.95*3*2*x - 5.9*2

#Newton-Raphson method function
def newtonRaphson(x):
    for i in range (2):
        xA = x - (myFunc(x)/myFunc1stDeri(x))
        x = xA
    print("The highest real root of this function: ")
    return x

#Secant method function
def secant(xB, x):
    for i in range (2):
        xA = x - myFunc(x) * ((x - xB)/(myFunc(x) - myFunc(xB)))
        xB = x
        x = xA
    print("The highest real root of this function: ")
    return x

print("Duong Minh Nhut - ITITWE19024\n")
print("Using Newton-Raphson method:")
print(newtonRaphson(3.5))
print("__________________________________")
print("\nUsing secant method:")
print(secant(2.5, 3.5))