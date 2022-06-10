import math
GR = (math.sqrt(5) - 1)/2

def f(x):
    return 4*x - 1.8*x*x + 1.2*x*x*x - 0.3*x*x*x*x

def Gss(xl, xu, es, imax):
    i = 0
    d = (xu - xl) * GR
    x1 = xl + d
    x2 = xu - d
    e = 100
    while i < imax and e > es:
        i = i + 1
        if f(x1) > f(x2):
            xl = x2
            x2 = x1
            d = (xu - xl) * GR
            x1 = xl + d
            continue
        else:
            xu = x1
            x1 = x2
            d = (xu - xl) * GR
            x2 = xu - d
            continue
    res = (x1 + x2) / 2
    print(res, f(res))

Gss(2, 4, 0.01, 10)
