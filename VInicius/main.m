clc
clear all
close all

%Leitura dos dados de entrada
data = readtable('clientes.csv');
Xc=table2array(data(:,1));
Yc=table2array(data(:,2));
B=table2array(data(:,3));

[vbest, xbest, ybest, Cbest, fpa] = SAp(0.9, 1e-1, Xc, Yc, B);






