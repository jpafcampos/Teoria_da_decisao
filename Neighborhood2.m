function [Vfim, Cl] = Neighborhood2(Vinit, C)
%Recebe um vetor binário, procura por 1, e os transforma em 0

    Vfim = Vinit;
     %Tamanho do Vetor
    n = length(Vinit);
    count = 0;
    p = 1;
    %indices do Vinit permutados aleatóriamente
    r = randperm(n);
    %vetor aux pra guardar os dois indices que contém o 1
    a = [0,0];
    i = 1;
    
    %Enquanto não encontrar dois 1
    while count ~= 2
        %Se for 1
        if Vfim(r(p)) == 1
            %Flip
            Vfim(r(p)) = not(Vinit(r(p)));
            %Armazena o índice
            a(i)  = r(p);
            count = count + 1;
            p = p + 1;
            i = i + 1;
        else 
            p = p + 1;
        end
    end
    %Atualiza os C
    C(a(1),:) = zeros(1,500); 
    C(a(2),:) = zeros(1,500);
    
    Cl = C;

end

