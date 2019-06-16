clc
clear all
close all

%Leitura dos dados de entrada
data = readtable('clientes.csv');
Xc=table2array(data(:,1));
Yc=table2array(data(:,2));
B=table2array(data(:,3));

%quanto maior o peso 'w', maior a enfase dada a função 2 - dist
%SA_soma_ponderada(alpha, Epsilon, Xc, Yc, B, w)

w = [0.1:0.1/2:0.9];
for i = 1:length(w)
    pontos_carregados = 0;
    [vbest, xbest, ybest, Cbest, f, f1, f2] = SA_soma_ponderada(0.9, 1e-1, Xc, Yc, B, w(i));
    num_Pa = floor(f1 * 75 + 25);
    dist = f2 * 15000 + 15000;
    cobertura = sum(sum(Cbest));
    for j=1:length(xbest)
        b(j) = (B'*Cbest(j,:)');
        if b(j) > 25
            pontos_carregados = pontos_carregados + 1;
        end
    end
    pontos_carregados = max(b);
    demanda_media = mean(b);
    sol(i,1) = num_Pa;
    sol(i,2) = dist;
    sol(i,3) = cobertura;
    sol(i,4) = pontos_carregados;
    %sol(i,4) = demanda_media;
end