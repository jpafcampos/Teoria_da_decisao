function [Vfim, Cl, D] = Neighborhood4(Vinit,Vpa,Xc,Yc,Xpa,Ypa,C,D, prob)
    %Liga 2 pontos aleatorios e desliga 2 pontos aleatorios 
    Vfim = Vinit;
    n = length(Vinit);
    count0 = 0;
    count1 = 0;
    p = 1;
    r = randperm(n);
    i = 1;
    j = 1;
    pontos_desligados = [0,0];
    pontos_ligados = [0,0];
    while ((count1 < 2) || (count0 < 2))
        if Vfim(r(p)) == 1
            if count1 < 2
                Vfim(r(p)) = not(Vinit(r(p)));
                pontos_desligados(j) = r(p);
                count1 = count1 + 1;
                p = p + 1;
                j = j + 1;
            end
        end
        if Vfim(r(p)) == 0
            if count0 < 2 
                Vfim(r(p)) = not(Vinit(r(p)));
                count0 = count0 + 1;
                pontos_desligados(i) = r(p);
                p = p + 1;
                i = i + 1;
            end
        end
        p = p + 1;
    end
    
    [Cl, D] = desliga_pa( pontos_desligados(1),Vpa,Xc,Yc,Xpa,Ypa,C, D );
    [Cl, D] = desliga_pa( pontos_desligados(2),Vpa,Xc,Yc,Xpa,Ypa,Cl,D);
    [Cl, D] = liga_pa( pontos_ligados(1),Vpa,Xc,Yc,Xpa,Ypa,Cl,D, prob);
    [Cl, D] = liga_pa( pontos_ligados(2),Vpa,Xc,Yc,Xpa,Ypa,Cl,D, prob);
end

