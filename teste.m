clc 
clear all
close all

clientes = readtable('clientes.csv');
Xc = clientes(:,1);
Yc = clientes(:,2);
Xc = table2array(Xc);
Yc = table2array(Yc);
B = clientes (:,3);
B = table2array(B);

%[ Xpa, Ypa, Vpa, C, D, gVpa ] = inicio_sol(Xc,Yc,B);
[vbest, xbest, ybest, Cbest] = SAp(0.9, 1, Xc, Yc, B);

