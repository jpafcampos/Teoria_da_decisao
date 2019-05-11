function [numPA] = NPA(v, x, y, Xc, Yc, C, d)
%Retorna o numero de pontos de acesso, considerando as restrições. Se uma
%restrição é violada, retorna o numero de PA's + 1000.
factivel = 1;
nPA = length(v);
nC = 500;
d = d';
b = 0;

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
            if (sqrt((x(i)-Xc(j))^2+(y(i)-Yc(j))^2) > 85)
            factivel=0;
            break
            end
        end
    end
end

%capacidade dos PA (150)
if (factivel == 1)
    for i=1:nPA
        b = d*C(i,:)';
        if b >150
            factivel = 0;
            break
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

if (factivel == 1)
    numPA = sum(v);
else
    numPA = 1000;
end