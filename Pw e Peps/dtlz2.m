%==========================================================================
% Universidade Federal de Minas Gerais
% Escola de Engenharia da UFMG
% Depto. de Engenharia El�trica
%
% Autor:
%   Lucas S. Batista
%
% Atualiza��o: 27/09/2018
%
% Nota:
%   Define a fun��o objetivo.
% =========================================================================


function f = dtlz2(x)

% m = 3 e n = 12

x = x(:);

k = 10;
n = length(x);
m = n - k + 1;

s = 0;
for i = m:n
    s = s + (x(i)-0.5)^2;
end
g = s;

cosx = cos(x*pi/2);
sinx = sin(x*pi/2);

f(1) =  (1+g) * prod(cosx(1:m-1));
for i = 2:m-1
    f(i) = (1+g) * prod(cosx(1:m-i)) * sinx(m-i+1);
end
f(m) = (1+g) * sinx(1);

f = f(:);
