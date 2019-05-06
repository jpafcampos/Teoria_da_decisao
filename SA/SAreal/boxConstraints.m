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
%   Garante que x respeite as restri��es de caixa (trunca as vair�veis nos
%   limitantes inferior e superior).
% =========================================================================


function x = boxConstraints(x, xlimites)

x = x(:);

lb = xlimites(1:2:end); 
ub = xlimites(2:2:end); 

lb = lb(:);
ub = ub(:);

x(x < lb) = lb(x < lb);
x(x > ub) = ub(x > ub);

