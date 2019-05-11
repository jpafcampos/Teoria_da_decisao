function [ Cl, D, Vfim] = Neighborhood1(Vinit,Xc,Yc,Xpa,Ypa,C,D)
%Recebe um vetor bin�rio, procura por um PA aleat�rio = 1 e o transforma em
%0
    
    Vfim = Vinit; 
    Vpa = Vinit;
    %Tamanho do Vetor
    n = length(Vinit);
    p = 1;
    %indices do Vinit permutados aleat�riamente

    r = randperm(n);

    %Procura por um 1
    while Vfim(r(p)) ~= 1
        p = p +1;
    end
    
    %Flip do primeiro 1 encontrado
     Vfim(r(p)) = not(Vinit(r(p)));
    
    %desliga o PA 
    %[ nC,nD, nVpa,ngVpa ] = desliga_pa( idVpa,Vpa,Xc,Yc,Xpa,Ypa,C,D,gVpa)
    [Cl, D, Vpa] = desliga_pa(r(p),Vpa,Xc,Yc,Xpa,Ypa,C,D);
 
end

