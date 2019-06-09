function [ Cl, D, Vpa] = Neighborhood1(Vinit,Xc,Yc,Xpa,Ypa,C,D)
%Recebe um vetor bin�rio, procura por um PA aleat�rio = 1 e o transforma em

 
    Vpa = Vinit;
    %Tamanho do Vetor
    n = length(Vinit);
    p = 1;
    %indices do Vinit permutados aleat�riamente

    r = randperm(n);
    achou = 0;
    %Procura por um 1
    while p < length(Vpa)
        if Vpa(r(p)) == 1
            achou = 1;
            break
        end
        p = p +1;
    end

    if ~achou
        Cl = C;
        D = D;
        Vpa = Vinit;
        return
    end
    %desliga o PA 
    [Cl, D, Vpa] = desliga_pa(r(p),Vpa,Xc,Yc,Xpa,Ypa,C,D);
 
end

