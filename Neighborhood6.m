function [ Yfim ] = Neighborhood6( Yinit )

u = rand();
G = 0;
indices = [0,1,4];
variable = randperm(3);
n = indices(variable(1));
exp = 1/(1+n);
Delta = 800 - Yinit;

if u < 0.5,
    G = 2*u^exp;
else
    G = 1-(2*(1 - u))^exp;
end

if rand() < 0.59,
    Yfim = Yinit + G*Delta;
else 
     Yfim = Yinit - G*Delta;
end
% 
if Yfim < 0,
    Yfim = 0;  
end

    
if Yfim > 800,
    Yfim = 800;  
end



end

