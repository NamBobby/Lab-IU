def Coef(x, y):     #Return an array of coefficiens
    list = []
    n = len(x)
    for i in range (n):
        list.append(y[i])
    for i in range (1, n):
           for j in range(n - 1, i - 1, -1):
                list[j] = (list[j] - list[j-1])/(x[j] - x[j - i])
    return list

def Newton(coef, x, x0):    #Return Newton polynomial
    res = 0
    n = len(x) - 1
    for i in range (n):
        temp = coef[i]
        for j in range (i):
            temp = temp * (x0 - x[j])
        res = res + temp
    return res

x = [0, 1, 2.5, 3, 4.5, 5, 6]
y = [2, 5.4375, 7.3516, 7.5625, 8.4453, 9.1875, 12]

coef = Coef(x,y)
res = Newton(coef, x, 3.5)
print(coef)
print(res)