function [to,nfe] = initialT(v, x, y, C, d,nfe,Xc,Yc)


N   = 100;      % número de testes
tau = 0.20;     % taxa de aceitação inicial


i = 1;          %contador
DeltaE = [1,N];   %DeltaE vetor que sarmazena DE

for k = 1:N,
    %perturbação usan N(1)
    %[vl,xl,yl, Cl] =  Neighborhood(v,x,y,C,1);
    [Cl,D,vl] =  Neighborhood(v, Xc,Yc, Xpa, Ypa, C, D,viz);
    %diferença DeltaE
    DE = NPA(vl,x,y,C,d, Xc, Yc) - NPA(v,x,y,C,d,Xc, Yc);
    %Atualiza número nfe
    nfe = nfe + 1; 
    
    if DE> 0,
        %Armazena o DE no Delta
        DeltaE(i) = DE;
        i = i + 1;
    end
end

%Media Delta
DeltaEM = mean(DeltaE);
%Atualiza Temperatura
to = - DeltaEM/log(tau);
end

