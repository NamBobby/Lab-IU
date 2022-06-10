import math
import numpy

func = lambda x: -26+85*x-91*x**2+44*x**3-8*x**4+x**5


def BisectionMethod(function, lower, upper, Es):

    iteration = 1
    print("%5s %10s %15s %15s %15s %5s" % ("Iteration", "lower", "upper", "x_midpoint", "f(lower).f(midpoint)", "E(a)"))
    midPoint = (lower + upper) / 2
    while function(lower) * function(upper) < 0:
        midPoint = (lower + upper) / 2
        previousRoot = midPoint
        if (function(lower) * function(midPoint)) < 0:
            upper = midPoint
        elif (function(lower) * function(midPoint)) > 0:
            lower = midPoint
        elif (function(lower) * function(midPoint)) == 0:
            return midPoint

        midPoint = (lower + upper) / 2
        presentRoot = midPoint

        approxError = math.fabs((presentRoot - previousRoot)/presentRoot) * 100
        print("%5s %10s %15s %15s %15s %15s" 
            % (iteration, lower, upper, midPoint, round(func(lower)*func(midPoint), 4), round(approxError, 4)))
        iteration += 1
        if approxError < Es*100:
            print("The real root of the function is:")
            return midPoint


def FalsePosition(function, lower, upper, Es):
    print("%5s %15s %15s %15s" % ("Iteration", "Previous Approximation", "Present Approximate","E(a)"))
    previousRoot = ( lower * function(upper) - upper * function(lower)) / (function(upper) - function(lower))
    print("%5s %15s %15s %15s" % (1, round(lower, 4), round(upper, 4), round(previousRoot, 4)))
    iteration = 2
    if (function(lower) < 0) and (function(upper) > 0):
        while True:
            previousRoot = (lower*function(upper) - upper*function(lower))/ (function(upper) - function(lower))
            if (function(previousRoot)) < 0:
                upper = previousRoot
            elif (function(previousRoot)) > 0:
                lower = previousRoot
            elif (function(previousRoot)) == 0:
                return previousRoot
            
            presentRoot = ( lower * function(upper) - upper * function(lower)) / (function(upper) - function(lower))
            approxError = math.fabs((presentRoot - previousRoot)/presentRoot) * 100
            print("%5s %15s %15s %15s %15s" % (iteration, round(lower, 4), round(upper, 4), round(presentRoot, 4), round(approxError, 4)))
            iteration += 1
            if approxError < Es*100:
                print("The real root of the function is: ")
                return presentRoot

print("Given the function f(x) = -26+85*x-91*x**2+44*x**3-8*x**4+x**5")
print("Using Bisection Method")
a = 0.5
b = 1
print(BisectionMethod(func, a, b, 0.1))
print("\nUsing False-positon Method")
print(FalsePosition(func, a, b, 0.002))
print("\nLe Thanh Phuong Nam - ITITWE19025\n")

