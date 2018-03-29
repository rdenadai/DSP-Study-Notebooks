import math
import numpy as np
import matplotlib.pyplot as plt
from mpmath import besseli

def filtro(wp,wr):

    wc = (wp + wr)/2
    d = 0.01
    Ap = 20*math.log10((1+d)/(1-d))
    Ar = -20*math.log10(d)


    if Ar < 21:
        b = 0
        D = .9222

    elif Ar < 50:
        b = 0.5842*(Ar-21)**0.4+0.07886*(Ar-21)
        D = (Ar - 7.95)/14.36
    else:
        b = .1102*(Ar-8.7)
        D = (Ar - 7.95)/14.36

    k = math.ceil(math.pi*D/(wr-wp)-.5)
    M = 2*k+1

    n = np.arange(-k,k+1,1)

    #w = besseli(0,b*np.sqrt(1-(4/M**2)*n**2))

    w = np.i0(b*np.sqrt(1-(4/M**2)*n**2))
    w = np.divide(w,besseli(0,b))

    h = wc/math.pi*np.sinc(wc*n/math.pi)*w

    return h

