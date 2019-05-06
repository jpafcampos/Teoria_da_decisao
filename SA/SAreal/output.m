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
%   Imprime a solu��o atual, o n�mero de itera��es (k), e a trajet�ria
%   percorrida at� que se atinja o ponto de �timo
% =========================================================================


function output (fun, vetor, k, xlimites)

%
% Sintaxe
% output (fun, vetor, k, xlimites)
% fun     : fun��o objetivo
% vetor   : conjunto de solu��es determinadas at� a itera��o k
% k       : itera��o corrente
% xlimites: limites inferior e superior das vari�veis 
%           [x1min x1max x2min x2max ... xnmin xnmax]
%

% -------------------------------------------------------------------------
% Imprime a solu��o corrente na tela de comandos do MatLab
if (k == 1), fprintf('\n'), end

tam   = length(xlimites);
[L,C] = size(vetor);

fprintf(1, 'x = [')
fprintf(1, '%+6.4f  ', vetor(L,1:end-1)')
fprintf(1, '\b\b]; \t f(x) = %+6.4f; \t iteration = %d\n', vetor(L,end),k)
% -------------------------------------------------------------------------

% Esta parte do c�digo � definida apenas para fun��es com duas vari�veis 
% (2D). Caso contr�rio, o processo de otimiza��o continua, por�m, a 
% trajet�ria das solu��es determinadas n�o � plotada.
if (tam ~= 4)    
    return
end

% -------------------------------------------------------------------------
% Este 'if' � acessado apenas uma vez, com o objetivo de plotar as curvas
% de n�vel da fun��o objetivo
if (k == 1)
    % fecha a janela corrente
    close
    
    % Plota as curvas de n�vel da fun��o objetivo    
    deltax = (xlimites(2) - xlimites(1))/30;
    deltay = (xlimites(4) - xlimites(3))/30;
    [x, y] = meshgrid(xlimites(1):deltax:xlimites(2), ...
                      xlimites(3):deltay:xlimites(4));    
    hold on
    z = fitnessEvaluation(fun, x, y);      
    cnivel = [linspace(0,vetor(L,end),10) linspace(vetor(L,end),vetor(L,end)+50,10)];
    
    % Plot em 2D
    c = contour(x,y,z,cnivel); clabel(c), grid on
    
    % ou,
    
    % Plot em 3D
    %mesh(x,y,z); box on, view([30 70])   
end
% -------------------------------------------------------------------------

% -------------------------------------------------------------------------
% Imprime o processo iterativo
hold on
xlabel('x1'), ylabel('x2'), zlabel('f(x)')
if (k == 1), vetor = [vetor; vetor]; end
plot3 (vetor(end-1:end,1), vetor(end-1:end,2), vetor(end-1:end,3), 'k*-')
axis(xlimites);
if (k == 1), pause(1), else drawnow, end
% -------------------------------------------------------------------------


