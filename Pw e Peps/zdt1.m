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


function f = zdt1(x)

% m = 2 e n = 30

n = length(x);
f1 = x(1);
su = sum(x)-x(1);    
g  = 1 + 9 * su / (n - 1);
f2 = (1 - sqrt(x(1) / g));

f = [f1 f2]';



