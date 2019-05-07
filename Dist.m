function [dist] = Dist(v, C, x, y, xc, yc, d)
%Função objetivo relativa às distâncias entre os PA e os clientes
nPA = length(x);
nC = 500;
dist = 0;

factivel = 1;

%restricao de distancia e de numero de pontos de acesso por cliente
for i=1:nPA
    if (factivel == 0)
        break
    end
    for j=1:nC
        
        if(sum(C(:,j))>1)
            factivel = 0;
            break
        end
        
        
        if (C(i,j) == 1)
            if (sqrt((x(i)-xc(j))^2+(y(i)-yc(j))^2) > 85)
            factivel=0;
            break
            end
        end
    end
end

%capacidade dos PA (150)
if (factivel == 1)
    for i=1:nPA
        for j=1:nC
        b = d(j)*v(i)*sum(C(i,:));
            if b>150
                factivel = 0;
            end

        end
    end
end

%fator de cobertura
if (factivel == 1)
soma = sum(sum(C))/500;
    if (soma<0.95)
        factivel = 0;
    end
end


for i=1:nPA
    for j=1:nC
        dist = dist + v(i)*C(i,j)*sqrt((x(i)-xc(j))^2+(y(i)-yc(j))^2);
    end
end

if (factivel == 0)
    dist = 2000;
end