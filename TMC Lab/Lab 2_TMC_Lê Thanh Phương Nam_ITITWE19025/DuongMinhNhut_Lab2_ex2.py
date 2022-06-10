import math

def myFunc(x):
    return -2*(x**6) - 1.6*(x**4) + (12*x) + 1

def myFunc1stDeri(x):
    return -12*(x**5) - 6.4*(x**3) + 12

#Calculte and print iterations of bisection
def bisection(f, low, up, es):
    print("%s %10s %15s %17s %15s %13s %18s %13s" % ("Iteration","Lower","Upper","x mid point","f'(low)","f'(up)","f'(midpoint)","E(a)"))
    iterator = 1
    while(up-low >= 0 or (abs(f(low))>= es and abs(f(up))>= es)):
        midpoint = (low+up)/2
        previousRoot = midpoint
        if (f(midpoint)==0):
            break
        elif (f(low)*f(midpoint)<0):
            up = midpoint
        else:
            low = midpoint
        
        midpoint = (low + up) / 2
        presentRoot = midpoint

        error = math.fabs((presentRoot - previousRoot)/presentRoot) * 100
        print("%5d %15.7f %15.7f %15.7f %15.7f %15.7f %15.7f %15.7f" %
                (iterator,low,up,midpoint,round(myFunc1stDeri(low),4),round(myFunc1stDeri(up),4),round(myFunc1stDeri(midpoint),4),round(error,4)))
        iterator+=1

        if error < es:
            print("\nThe function is maximum when x is: " + "%10.5f"  % midpoint)
            print("The function maximum value is    : " + "%10.5f" %  myFunc(midpoint))
            return "\n"
    
print("\nDuongMinhNhut - ITITWE19024\n")
print("Using bisection:")
print(bisection(myFunc1stDeri, 0, 1, 5))
