clc
clear all
close all

%Leitura dos dados de entrada
data = readtable('clientes.csv');
Xc=table2array(data(:,1));
Yc=table2array(data(:,2));
B=table2array(data(:,3));

%quanto maior o peso 'w', maior a enfase dada a função 1 - numero de PA
[vbest, xbest, ybest, Cbest, f, f1, f2] = SA_soma_ponderada(0.9, 1e-1, Xc, Yc, B, 0.1);
