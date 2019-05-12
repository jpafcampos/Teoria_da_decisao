function [ Xfim, Cl] = Neighborhood5( Xinit, C)
%Move a coordenada x 

u = rand();
G = 0;
indices = [0,1,4];
variable = randperm(3);
n = indices(variable(1));
exp = 1/(1+n);
Delta = 800 - Xinit;

if u < 0.5,
    G = 2*u^exp;
else
    G = 1-(2*(1 - u))^exp;
end

if rand() < 0.59,
    Xfim = Xinit + G*Delta;
else 
     Xfim = Xinit - G*Delta;
end
% 
if Xfim < 0,
    Xfim = 0;  
end

    
if Xfim > 800,
    Xfim = 800;  
end


end

