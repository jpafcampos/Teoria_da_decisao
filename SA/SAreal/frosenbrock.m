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


function f = frosenbrock(x)

% Função objetivo
f = 100*(x(2)-x(1)^2)^2 + (1-x(1))^2;
