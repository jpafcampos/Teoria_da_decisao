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


function f = fbazaraa(x)

% Fun��o objetivo
f = (x(1) - 2).^4 + (x(1) - 2*x(2)).^2;
