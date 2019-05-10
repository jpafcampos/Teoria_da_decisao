function [ Vfim, Cl ] = Neighborhood1(Vinit,C)
%Recebe um vetor binário, procura por um PA aleatório = 1 e o transforma em
%0
    
    Vfim = Vinit;
    
    %Tamanho do Vetor
    n = length(Vinit);
    p = 1;
    %indices do Vinit permutados aleatóriamente
    r = randperm(n);
    
    %Procura por um 1
    while Vfim(r(p)) ~= 1
        p = p +1;
    end
    
    %Flip do primeiro 1 encontrado
    Vfim(r(p)) = not(Vinit(r(p)));
    
    %Atualiza Cl
    C(r(p),:) = zeros(1,500); 
    Cl = C;
end

