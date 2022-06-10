#Excercise 1:
#import lib

import math as m
import numpy as np
import matplotlib.pyplot as plt
import timeit
from matplotlib.pyplot import figure


def f(x): #define the function
  return 4*x - 1.8 * (x**2) + 1.2 * (x**3) - 0.3 * (x**4)

l1 = []
l2 = []
l3 = []
l4 = []

def golden_section(f, xL, xU, e_s, max_iter): #define the GOlden section
  print("%-2s%-8s%-8s%-8s%-8s%-8s%-8s%-8s%-8s%-8s%-8s%-9s" % ("i","xL","f(xL)","x2","f(x2)","x1","f(x1)","xU","f(xU)","d","Opt","Error"))
  R=(m.sqrt(5)-1)/2
  xOpt=0
  for iter in range (0,max_iter):
    d=R*(xU-xL)
    x1=xL+d
    x2=xU-d

    if f(x2)>f(x1):
      xOpt=x2
      xU=x1

    if f(x2)<f(x1):
      xOpt=x1
      xL=x2

    err=(1-R)*abs((xU-xL)/xOpt)*100
    print("%-2d%-8.5f%-8.5f%-8.5f%-8.5f%-8.5f%-8.5f%-8.5f%-8.5f%-8.5f%-8.5f%-9.5f" % (iter,xL,f(xL),x2,f(x2),x1,f(x1),xU,f(xU),d,xOpt,err))
    l1.append(xL)
    l2.append(f(xL))
    l3.append(xOpt)
    l4.append(f(xOpt))
    if err < 1:
      return xOpt , f(xOpt)
  
print("LÊ THANH PHƯƠNG NAM_ITITWE19025_eX1:\n ")
#solve function & calculate the time to run
starttime = timeit.default_timer()
print(" Optimal point and value are: \n" + str(golden_section(f,2, 4, 1, 1000)))
figure(num=None, figsize=(5, 5), dpi=80, facecolor='w', edgecolor='k')
plt.figure()
plt.subplot(2, 1, 2)
plt.plot(l1, l2, 'r-')
plt.plot(l3, l4, '-.')
plt.title("Golden section search")
plt.xlabel('x')
plt.ylabel('f(x)')
plt.show()
print("The runtime is : ", timeit.default_timer() - starttime, 'second.')