function [Vfim] = Neighborhood3(Vinit)
    Vfim = Vinit;
    n = length(Vinit);
    count0 = 0;
    count1 = 0;
    p = 1;
    r = randperm(n);
    while ((count1 ~= 1) || (count0 ~= 1))
        if Vfim(r(p)) == 1
            if(count1 == 0)
                Vfim(r(p)) = not(Vinit(r(p)));
                count1 = count1 + 1;
                p = p + 1;
            end
        end
        if Vfim(r(p)) == 0
            if(count0 == 0)
                Vfim(r(p)) = not(Vinit(r(p)));
                count0 = count0 + 1;
                p = p + 1;
            end
        end
        p = p + 1;
    end
end

