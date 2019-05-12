function [to,nfe] = initialT2(v, x, y, C, B,nfe,Xc,Yc, D)


N   = 100;      % n�mero de testes
tau = 0.20;     % taxa de aceita��o inicial


i = 1;          %contador
DeltaE = [1,N];   %DeltaE vetor que sarmazena DE

for k = 1:N,
    %perturbamos usando N(5)
    nPA = sum(v);
    indice = round((nPA-1)*rand()) + 1;    xindice = x(indice);
    [xfim, Cl,D,v] =  Neighborhood5(xindice, indice,v, Xc, Yc,x,y,C,D); %modifica o C tb n � o indice da vizinhan�a
    xl(indice) = xfim;
    %diferen�a DeltaE
    DE = Dist_total(v, Cl, xl, y, Xc, Yc, B) - Dist_total(v, C, x, y, Xc, Yc, B);
    %Atualiza n�mero nfe
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
