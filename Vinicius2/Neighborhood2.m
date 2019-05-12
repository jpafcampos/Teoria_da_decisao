function [Cl, D, Vpa] = Neighborhood2(Vinit,Xc,Yc,Xpa,Ypa,C,D)
%Recebe um vetor bin�rio, procura por 1, e os transforma em 0

    Vpa = Vinit;
     %Tamanho do Vetor
    n = length(Vinit);
    count = 0;
    p = 1;
    %indices do Vinit permutados aleat�riamente
    r = randperm(n);
    %vetor aux pra guardar os dois indices que cont�m o 1
    a = [0,0];
    i = 1;
    
    %Enquanto n�o encontrar dois 1
    while count ~= 2
        %Se for 1
        if Vpa(r(p)) == 1
            %Flip
            Vpa(r(p)) = not(Vinit(r(p)));
            %Armazena o �ndice
            a(i)  = r(p);
            count = count + 1;
            p = p + 1;
            i = i + 1;
        else 
            p = p + 1;
        end
    end
    %Desliga os PA
    [Cl, D, Vpa] = desliga_pa( a(1),Vpa,Xc,Yc,Xpa,Ypa,C, D);
    [Cl, D, Vpa] = desliga_pa( a(2),Vpa,Xc,Yc,Xpa,Ypa,Cl,D);
    

end

