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


function f = frosenbrock(x)

% Fun��o objetivo
f = 100*(x(2)-x(1)^2)^2 + (1-x(1))^2;
