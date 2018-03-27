%Projeta um filtro passa baixas com frequência de passagem
%wp rad/amostra e frequência de rejeição wr rad/amostra. 
%Retorna o filtro no vetor h
%Uso: h - filtro(wp,wr);
% A implementação feita aqui é baseada no método mostrado no livro
% Diniz, Paulo SR, Eduardo AB da Silva, and Sergio L. Netto. 
% Processamento Digital de Sinais-: Projeto e Análise de Sistemas. 
% Bookman Editora, 2014.

function h = filtro(wp,wr)

wc = (wp+wr)/2;

d = .01;
Ap = 20*log10((1+d)/(1-d));
Ar = -20*log10(d);

if Ar < 21
    b = 0;
    D = .9222;
elseif Ar < 50
    b = 0.5842*(Ar-21)^0.4+0.07886*(Ar-21);
    D = (Ar - 7.95)/14.36;
else
    b = .1102*(Ar-8.7);
    D = (Ar - 7.95)/14.36;
end

k = ceil(pi*D/(wr-wp)-.5);
M = 2*k+1;

n = -k:k;
w = besseli(0,b*sqrt(1-(4/M^2)*n.^2))/besseli(0,b);
h = wc/pi*sinc(wc*n/pi).*w;
