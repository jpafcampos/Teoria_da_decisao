
clc
clear all
close all

pi=3.14;

data = readtable('clientes.csv');
Xc=table2array(data(:,1));
Yc=table2array(data(:,2));
B=table2array(data(:,3));

[ Xpa, Ypa, Vpa, C, D, gVpa ] = inicio_sol(Xc,Yc,B);
[C,D,Vpa,gVpa]=desliga_pa(10,Vpa,Xc,Yc,Xpa,Ypa,C,D,gVpa);
[C,D,Vpa,gVpa]=liga_pa(10,Vpa,Xc,Yc,Xpa,Ypa,C,D,gVpa);

