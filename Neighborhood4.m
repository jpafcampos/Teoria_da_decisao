function [Vfim, Cl] = Neighborhood4(Vinit, C)
     Vfim = Vinit;
    n = length(Vinit);
    count0 = 0;
    count1 = 0;
    p = 1;
    r = randperm(n);
    i = 1;
    zero = [0,0];
    um = [0,0];
    
    while ((count1 < 2) || (count0 < 2))
        if Vfim(r(p)) == 1
            if count1 < 2
                Vfim(r(p)) = not(Vinit(r(p)));
                count1 = count1 + 1;
                p = p + 1;
                
            end
        end
        if Vfim(r(p)) == 0
            if count0 < 2 
                Vfim(r(p)) = not(Vinit(r(p)));
                count0 = count0 + 1;
                zero(i) = r(p);
                p = p + 1;
                i = i + 1;
            end
        end
        p = p + 1;
    end

    C(zero(1),:) = zeros(1,500);
    C(zero(2),:) = zeros(1,500);
    Cl = C;

end

