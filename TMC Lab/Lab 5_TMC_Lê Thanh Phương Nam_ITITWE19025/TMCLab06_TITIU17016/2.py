import math
GR = (math.sqrt(5) - 1)/2

def f(x, y):
    return 3.5*x + 2*y + x*x - x*x*x*x - 2*x*y - y*y

def Gssx(xl, xu, y, imax):
    i = 0
    d = (xu - xl) * GR
    x1 = xl + d
    x2 = xu - d
    e = 100
    while i < imax:
        i = i + 1
        if f(x1, y) > f(x2, y):
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
    return (x1 + x2) / 2

def Gssy(xl, xu, y, imax):
    i = 0
    d = (xu - xl) * GR
    x1 = xl + d
    x2 = xu - d
    e = 100
    while i < imax:
        i = i + 1
        if f(y, x1) > f(y, x2):
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
    return (x1 + x2) / 2

def Rs(l, r, sample):
    x = l
    y = l
    i = 0
    while i < sample:
        x = Gssx(l, r, y, 1000)
        y = Gssy(l, r, x, 1000)
        i = i + 1
    return (x, y, f(x,y))
print(Rs(-2, 2, 10))
