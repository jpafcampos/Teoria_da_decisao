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
%   Imprime a solução atual, o número de iterações (k), e a trajetória
%   percorrida até que se atinja o ponto de ótimo
% =========================================================================


function output (fun, vetor, k, xlimites)

%
% Sintaxe
% output (fun, vetor, k, xlimites)
% fun     : função objetivo
% vetor   : conjunto de soluções determinadas até a iteração k
% k       : iteração corrente
% xlimites: limites inferior e superior das variáveis 
%           [x1min x1max x2min x2max ... xnmin xnmax]
%

% -------------------------------------------------------------------------
% Imprime a solução corrente na tela de comandos do MatLab
if (k == 1), fprintf('\n'), end

tam   = length(xlimites);
[L,C] = size(vetor);

fprintf(1, 'x = [')
fprintf(1, '%+6.4f  ', vetor(L,1:end-1)')
fprintf(1, '\b\b]; \t f(x) = %+6.4f; \t iteration = %d\n', vetor(L,end),k)
% -------------------------------------------------------------------------

% Esta parte do código é definida apenas para funções com duas variáveis 
% (2D). Caso contrário, o processo de otimização continua, porém, a 
% trajetória das soluções determinadas não é plotada.
if (tam ~= 4)    
    return
end

% -------------------------------------------------------------------------
% Este 'if' é acessado apenas uma vez, com o objetivo de plotar as curvas
% de nível da função objetivo
if (k == 1)
    % fecha a janela corrente
    close
    
    % Plota as curvas de nível da função objetivo    
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


