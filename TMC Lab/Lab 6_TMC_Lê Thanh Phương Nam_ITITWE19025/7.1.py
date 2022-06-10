x1 = 8
y1 = 0.9030900
x2 = 12
y2 = 1.0791812
slope = (y2 - y1)/(x2 - x1)
intercept = y2 - slope * x2
log10 = intercept + slope * 10
print("a) Estimated value of log 10 is: ", log10)
print("Relative error is: ", abs(log10 - 1)/1)

x1 = 9
y1 = 0.9542425
x2 = 11
y2 = 1.0413927
slope = (y2 - y1)/(x2 - x1)
intercept = y2 - slope * x2
log10 = intercept + slope * 10
print("b) Estimated value of log 10 is: ", log10)
print("Relative error is: ", abs(log10 - 1)/1)





