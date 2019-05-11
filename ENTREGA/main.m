clc
clear all
close all

%Leitura dos dados de entrada
data = readtable('clientes.csv');
Xc=table2array(data(:,1));
Yc=table2array(data(:,2));
B=table2array(data(:,3));

[ Xpa, Ypa, Vpa, C,D, gVpa ] = solucao_inicial(Xc,Yc,B);
fpa=numero_pa(Vpa, Xpa, Ypa, Xc, Yc,C,B);

%[ nC,nD, nVpa,ngVpa ] = desliga_pa( idVpa,Vpa,Xc,Yc,Xpa,Ypa,C,D,gVpa);