clc
clear all
close all

%Leitura dos dados de entrada
data = readtable('clientes.csv');
Xc=table2array(data(:,1));
Yc=table2array(data(:,2));
B=table2array(data(:,3));

[ Xpa, Ypa, Vpa, C,D, gVpa ] = solucao_inicial(Xc,Yc,B);
%[vbest, xbest, ybest, Cbest, fPA] = SAp(0.9, 1e-1, Xc, Yc, B);