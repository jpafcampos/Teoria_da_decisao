function [Cl, D, Vpa] = Neighborhood3(Vinit,Xc,Yc,Xpa,Ypa,C,D)
   %Liga um PA aleatorio e desliga outro PA aleatorio
    Vpa = Vinit;
    n = length(Vinit);
    count0 = 0;
    count1 = 0;
    p = 1;
    r = randperm(n);
    
    ponto_ligado = 0;
    ponto_desligado = 0;

    
    while ((count1 ~= 1) || (count0 ~= 1))
        if Vpa(r(p)) == 1
            if(count1 == 0)
                Vpa(r(p)) = not(Vinit(r(p)));
                ponto_desligado = r(p);
                count1 = count1 + 1;
                p = p + 1;
            end
        else
            if(count0 == 0)
                Vpa(r(p)) = not(Vinit(r(p)));
                ponto_ligado = r(p);
                count0 = count0 + 1;
                p = p + 1;
            end
        end
        p = p + 1;
    end
    
     [ Cl,D, Vpa] = desliga_pa( ponto_desligado,Vpa,Xc,Yc,Xpa,Ypa,C,D);
     [ Cl,D,Vpa] = liga_pa( ponto_ligado,Vpa,Xc,Yc,Xpa,Ypa,Cl,D);
    
end

