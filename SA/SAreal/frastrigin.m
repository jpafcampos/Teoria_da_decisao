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
%   Define a função objetivo.
% =========================================================================


function f = frastrigin(x)

x = x(:);

%
%   Rastrigin: f = \sum_{i=1}^{n} (x_i^2 - 10 \cos(2 \pi x_i))
%

Q = [1 0; 0 1]; 
X = Q*x;
n = length(X);

f = 0;
for i = 1:n
   f = f + X(i)^2 - 10*cos(2*pi*X(i));
end

%
%   ou, uma formulação diferente...
%

%A = [1 0; 0 4];
%f = x'*A'*A*x - 10*[1 1]*cos(2*pi*A*x);  

