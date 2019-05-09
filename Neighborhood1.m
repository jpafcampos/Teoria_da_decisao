function [ vfim ] = Neighborhood1(Vinit)
%Recebe um vetor bin�rio e da o flip em uma posi��o

    vfim = Vinit;
    n = length(Vinit);
    p = 1;
    r = randperm(n);
    
    while vfim(r(p)) ~= 1
        p = p +1;
    end
    
    vfim(r(p)) = not(Vinit(r(p)));

end

