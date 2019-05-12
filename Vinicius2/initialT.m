function [to,nfe] = initialT(v, x, y, C, B,nfe,Xc,Yc, D)


N   = 100;      % n�mero de testes
tau = 0.20;     % taxa de aceita��o inicial


i = 1;          %contador
DeltaE = [1,N];   %DeltaE vetor que sarmazena DE

for k = 1:N,
    %perturba��o usan N(1)
    %[vl,xl,yl, Cl] =  Neighborhood(v,x,y,C,1);
    [Cl,D,vl] =  Neighborhood(v, Xc,Yc, x, y, C, D,1);
    %diferen�a DeltaE
    DE = numero_pa(vl, x, y, Xc, Yc, Cl, B) - numero_pa(v, x, y, Xc, Yc, C, B);
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

