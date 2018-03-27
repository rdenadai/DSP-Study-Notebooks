%Essa função plota o espectro do sinal de entrada (y). São mostradas apenas as
%frequências positivas, já que se assume que o sinal é real e, portanto,
%as frequências negativas são o conjugado das positivas. O eixo x mostra
%a frequência em rad/amostra.

function espectro(y)

Y = abs(fft(y));
w = linspace(0,pi,floor(length(y)/2));
Y = Y(1:(length(w)));
figure; plot(w,Y,'-');
xlabel('\omega (rad)')
ylabel('|Y(e^{j\omega})|')
axis([0 pi 0 max(Y)])
grid;