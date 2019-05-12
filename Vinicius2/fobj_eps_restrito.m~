function [f] = fobj_eps_restrito(v, C, x, y, xc, yc, B, w)
nPA = length(x);
nC = 500;
dist = 0;

factivel = 1;


b = 0;
sB=zeros(64,1);
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
%           sB(i)=sB(i)+B(j);
%             sB(i)
%             if sB(i) >150
%                 factivel = 0;
%             end
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
        b = sum(B(:)*C(i,:));
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
    num_PA = sum(v);
    num_PA = (num_PA - 30)/(100-30);
    num_PA = num_PA*w;
    for i=1:nPA
        for j=1:nC
            dist = dist + v(i)*C(i,j)*sqrt((x(i)-xc(j))^2+(y(i)-yc(j))^2);
        end
    end
   
    dist = dist*(1-w);
else
    f = 100000;
end

f = num_PA + dist;

end



