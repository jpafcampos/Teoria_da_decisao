%==========================================================================
% Universidade Federal de Minas Gerais
% Escola de Engenharia da UFMG
% Depto. de Engenharia Elétrica
%
% Autor:
%   Lucas S. Batista
%
% Atualização: 26/09/2018
%
% Nota:
%   Define a função objetivo.
% =========================================================================


function [xretorno,xcusto] = fobj(x,projetos,capital)

% Problema da Mochila Binário:
% Considere n projetos e um capital de investimento b. O
% projeto j tem um custo aj e um retorno esperado pj.
% Formule um problema que permita selecionar o portfólio
% de projetos que maximiza o retorno sem exceder os recursos
% disponíveis.
    
% projetos = [a1 a2 ... aj ... an
%             p1 p2 ... pj ... pn]

% custo associado a x
xcusto   = projetos(1,:)*x(:); 

% retorno associado a x (penalizado)
xretorno = projetos(2,:)*x(:) - 100*(max(0, xcusto - capital))^2; 


