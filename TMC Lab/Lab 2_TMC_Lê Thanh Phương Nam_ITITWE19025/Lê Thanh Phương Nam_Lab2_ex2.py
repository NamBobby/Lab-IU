import math
import numpy

def func(x):
    return -2*(x**6) - 1.6*(x**4) + (12*x) + 1

def funcderi(x):
    return -12*(x**5) - 6.4*(x**3) + 12

def BisectionMethod(function, lower, upper, Es):
    iteration = 1
    print("%s %10s %15s %17s %15s %13s %18s %13s" % ("Iteration","Lower","Upper","x_midpoint","f'(lower)","f'(upper)","f'(midpoint)","E(a)"))
    while (upper-lower >= 0 or (abs(function(lower))>= Es and abs(function(upper))>= Es)):
        midpoint = (lower + upper) / 2
        previousRoot = midpoint
        if (function(midpoint)==0):
            break
        elif (function(lower)*function(midpoint)<0):
            upper = midpoint
        else:
            lower = midpoint
        
        midpoint = (lower + upper) / 2
        presentRoot = midpoint
        
        approxError = math.fabs((presentRoot - previousRoot)/presentRoot) * 100
        print("%5d %15.7f %15.7f %15.7f %15.7f %15.7f %15.7f %15.7f" % (iteration, lower, upper, midpoint, round(funcderi(lower), 4), round(funcderi(upper), 4), round(funcderi(midpoint), 4),round(approxError, 4)))
        iteration += 1
        if approxError < Es*100:
            print("The maximum will lie between: %10.5f and %10.5f" % (lower , midpoint))
            print("The function maximum value is: " + "%10.5f" %  func(midpoint))
            return "\n"

print("Given the function f(x) = -2*x**6 - 1.6*x**4 + 12*x + 1")
print("Using Bisection Method")
print(BisectionMethod(funcderi, 0, 1, 0.05))
print("\nLe Thanh Phuong Nam - ITITWE19025\n")


