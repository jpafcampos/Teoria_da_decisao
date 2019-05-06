clc 
clear all
close all

clientes = readtable('clientes.csv');
x = clientes(:,1);
y = clientes(:,2);
x = table2array(x);
y = table2array(y);

p = [x, y];
plot(x,y,'ro');
pontosx = [0:85:800];
for i=1:10
    pontosy(i,:) = [0:85:800];
end
pontosy = pontosy+15;
pontosx = pontosx+15;

hold on
plot (pontosx, pontosy, 'k*');