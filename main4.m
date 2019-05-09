
clc
clear all
close all

pi=3.14;

data = readtable('clientes.csv');
Xc=table2array(data(:,1));
Yc=table2array(data(:,2));
B=table2array(data(:,3));

[ Xpa, Ypa, Vpa, C ] = inicio_sol(Xc,Yc,B);
