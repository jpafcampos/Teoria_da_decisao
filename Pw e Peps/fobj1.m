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


function f = fobj1(x)

f1 = x(1)^2 + x(2)^2;
f2 = (x(1)-1)^2 + (x(2)-1)^2;

f = [f1 f2]';
