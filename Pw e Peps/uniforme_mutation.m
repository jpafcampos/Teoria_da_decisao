%==========================================================================
% Universidade Federal de Minas Gerais
% Escola de Engenharia da UFMG
% Depto. de Engenharia Elétrica
%
% Autor:
%   Lucas S. Batista
%
% Atualização: 27/09/2018
%
% Nota:
%   Realiza mutação uniforme
% =========================================================================


function y = uniforme_mutation(x,ub,lb,sigma,xlimites,n)

D = 2*rand(n,1) - 1;
delta = sigma*(ub - lb).*D;

p = ceil(n/3);
d = zeros(1,n);
r = round((n-1)*rand(1,p)+1);
d(r) = 1;
H = diag(d);

y = x + 1*delta;
y = boxConstraints(y, xlimites);

