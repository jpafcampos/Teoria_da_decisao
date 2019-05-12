function [ Cl, D, Vpa] = Neighborhood1(Vinit,Xc,Yc,Xpa,Ypa,C,D)
%Recebe um vetor bin�rio, procura por um PA aleat�rio = 1 e o transforma em

 
    Vpa = Vinit;
    %Tamanho do Vetor
    n = length(Vinit);
    p = 1;
    %indices do Vinit permutados aleat�riamente

    r = randperm(n);

    %Procura por um 1
    while Vpa(r(p)) ~= 1
        p = p +1;
    end
    
    %desliga o PA 
    [Cl, D, Vpa] = desliga_pa(r(p),Vpa,Xc,Yc,Xpa,Ypa,C,D);
 
end

