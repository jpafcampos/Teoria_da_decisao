function [ Vfim ] = Neighborhood2(Vinit)
%Recebe um vetor binário e da o flip em duas posições

    Vfim = Vinit;
    n = length(Vinit);
    count = 0;
    p = 1;
    r = randperm(n);
    
    while count ~= 2
        if Vfim(r(p)) == 1
            Vfim(r(p)) = not(Vinit(r(p)));
            count = count + 1;
            p = p + 1;
        else 
            p = p + 1;
        end
    end
    

end

