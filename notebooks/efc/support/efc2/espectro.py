import math
import numpy as np
import matplotlib.pyplot as plt

def espectro(y):

    #número de pontos da DFT
    N = 2048
    #módulo da transf. de Fourier
    Y = abs(np.fft.fft(y,N))
    #frequências avaliadas
    w = np.linspace(0,math.pi,math.floor(Y.size/2))

    #exibe o gráfico do espectro
    plt.figure() 
    plt.plot(w,Y[0:w.size])
    plt.xlabel(r'$\omega$ [rad]', fontsize=10)
    plt.ylabel(r'|$Y(e^{j\omega})$|', fontsize=10)
    plt.grid(True)
    plt.title('Resposta em frequência')
    plt.xlim(0,math.pi)
    plt.ylim(0,max(Y))
    plt.show()
    