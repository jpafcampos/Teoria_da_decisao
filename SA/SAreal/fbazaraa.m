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


function f = fbazaraa(x)

% Função objetivo
f = (x(1) - 2).^4 + (x(1) - 2*x(2)).^2;
