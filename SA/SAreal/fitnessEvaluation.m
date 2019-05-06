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
%   Retorna uma matriz z contendo dados para plotar a função objetivo.
% =========================================================================


function z = fitnessEvaluation (fun, x, y)

%
% Sintaxe
% z = fitnessEvaluation (fun, x, y)
% fun: função objetivo
% x,y: matrizes obtidas por meio do comando 'meshgrid'
%

[L,C] = size(x);
for i = 1:L,
    for j = 1:C,      
        z(i,j) = feval(fun, [x(i,j) y(i,j)]);
    end
end

