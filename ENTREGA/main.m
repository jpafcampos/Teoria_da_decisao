clc
clear all
close all

%Leitura dos dados de entrada
data = readtable('clientes.csv');
Xc=table2array(data(:,1));
Yc=table2array(data(:,2));
B=table2array(data(:,3));

[ Xpa, Ypa, Vpa, C,D, gVpa ] = solucao_inicial(Xc,Yc,B);

idVpa=10;

for j=1:500
    for k=1:64
        if (C(k,j)==1)
            v(j)=k;
        end
    end
end
   
for i=1:14
    fpa=numero_pa(Vpa, Xpa, Ypa, Xc, Yc,C,B);
    [ C,D, Vpa ]=desliga_pa( idVpa,Vpa,Xc,Yc,Xpa,Ypa,C,D);    
    for j=1:500
        for k=1:64
            if (C(k,j)==1)
                v(1,j)=k;
            end
        end
    end
    idVpa=randi(63)+1;
    v(2,i)=idVpa;
end


