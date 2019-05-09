function [ vfim ] = Neighborhood1(Vinit)
%Recebe um vetor binário e da o flip em uma posição

    vfim = Vinit;
    n = length(Vinit);
    p = 1;
    r = randperm(n);
    
    while vfim(r(p)) ~= 1
        p = p +1;
    end
    
    vfim(r(p)) = not(Vinit(r(p)));

end

