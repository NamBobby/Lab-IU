import math
import matplotlib.pyplot as plt
import timeit
from pylab import *
from scipy.special.orthogonal import p_roots
from scipy import integrate

# define the function


def f(x): return (x**0.1)*(1.2-x)*(1-np.exp(20*(x-1)))

# using scipy.integrate.quadrature() method
sol = integrate.quadrature(f, 0.0, 1.0)

print("Duong Minh Nhut - ITITWE19024")
starttime = timeit.default_timer()
print("\nAnswer   :", sol)

def gfg(x): return 5*x*np.exp(-2*x)
# using scipy.integrate.romberg()
geek = integrate.romberg(gfg, 0, 3, show=True)
print("\nAnswer   :", geek)
