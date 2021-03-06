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
%   Aproxima o ponto de �timo (minimiza��o) de um problema irrestrito
%   usando o Algoritmo Simulated Annealing (VERS�O SIMPLES).
% =========================================================================


%function [xbest, jxbest, nfe] = SAreal (fobj, x, xlimites)

clc
clear all
close all

pi=3.14;

data = readtable('clientes.csv');
Xc=table2array(data(:,1));
Yc=table2array(data(:,2));
B=table2array(data(:,3));

Nc=length(Xc);


Ai=800;
Aj=Ai;
fcor=1;
fcob=1;
rpa=85;
Apa=pi*(rpa)^2;
nPA=(round(sqrt(round((Ai*Aj*fcob*fcor)/Apa)*2))+1)^2;
sPA=sqrt(nPA);
Xi=round(linspace(rpa/2*fcob,Ai-rpa/2*fcob,sqrt(nPA)));
Yi=round(linspace(rpa/2*fcob,Ai-rpa/2*fcob,sqrt(nPA)));
Xpa=zeros(nPA,1);
Ypa=zeros(nPA,1);
Vpa=ones(nPA,1);
C=zeros(nPA,Nc);

k=1;
j=k;



for i=1:sPA
    for j=k:(k+sPA-1)
        Xpa(j)=Xi(i);
        Ypa(j)=Yi(j+1-k);
    end
    k=j+1;
end




D=zeros(nPA,Nc);
pC=ones(nPA,Nc);
sB=zeros(nPA,1);
sC=zeros(Nc,1);
for i=1:nPA
    for j=1:Nc
        D(i,j)=sqrt((Xpa(i)-Xc(j))^2+(Ypa(i)-Yc(j))^2);
        if (D(i,j)>85)
            pC(i,j)=0;
        else
            sB(i)=sB(i)+B(j);
        end
    end
end
[ordsB,idsB]=sort(sB);

%Abordagem de inicio pelos que atende mais

natendidos=0;

for i=1:nPA
    id=idsB(i);
    Vpa(id)=0;
    aux= pC(id,:);
    g=zeros(1,Nc);
    pC(id,:)=g;
    flagerro=0;
    
    for j=1:Nc
        sC(j)=sum(pC(:,j));
        if (sC(j)<1)
                         pC(id,:)=aux;
                            Vpa(id)=1;
                            flagerro=1;
                            break;
%             natendidos=natendidos+1;
%             if (natendidos/Nc)<(0.05)
%                 flagerro=0;
%             else   
%                 pC(id,:)=aux;
%                 Vpa(id)=1;
%                 flagerro=1;
%                 break;
%             end
        end
    end
    if (flagerro==0)
        Xpa(id)=0;
        Ypa(id)=0;
    end
    
end

pp=sum(Vpa);
for j=1:Nc
    sC(j)=sum(pC(:,j));
end


plot(Xpa,Ypa,'bo');
hold on
plot (Xc, Yc, 'k*');

% for i=1:N
%     PA(i,:)=randi([1 tEspaco],1,2);
% end



%
%
% %
% % Sintaxe
% % [xbest, jxbest, nfe] = SAreal(fun, x, xlimites)
% % fun     : fun��o objetivo
% % x       : vetor solu��o inicial [x1 x2 ... xn]
% % xlimites: limites inferior e superior das vari�veis
% %           [x1min x1max x2min x2max ... xnmin xnmax]
% %
% % Exemplo
% % [xbest, jxbest, nfe] = SAreal(@fbazaraa, [+3.0 +3.0], [0 4 0 4])
% % [xbest, jxbest, nfe] = SAreal(@frosenbrock, [-1.0 +1.5], [-1.5 1.5 -1.0 1.5])
% % [xbest, jxbest, nfe] = SAreal(@frastrigin, [+2 +2], [-2 2 -2 2])
% %
%
%
% % Contador de est�gios do m�todo
% k = 0;
%
% % Contador do n�mero de avalia��es de f(.)
% nfe = 0;
%
% % N�mero de vari�veis de decis�o
% n = length(x);
%
% % Defini��o dos vetores limites
% lb = xlimites(1:2:end); lb = lb(:);
% ub = xlimites(2:2:end); ub = ub(:);
%
% % Desvio padr�o inicial da vizinhan�a
% sigma = 0.25;
%
% % Temperatura inicial
% [to,x,jx,nfe] = initialT(fobj,x(:).',ub,lb,sigma,xlimites,nfe,n);
% t = to;
%
% % Armazena melhor solu��o encontrada
% xbest  = x;
% jxbest = jx;
%
% % Crit�rio de parada do algoritmo
% numEstagiosEstagnados = 0;
%
% % Armazena o caminho percorrido em dire��o ao �timo
% caminho(1,:) = [xbest' jxbest];
%
% % Imprime o resultado da busca encontrado at� a itera��o corrente
% output(fobj, caminho, size(caminho,1), xlimites);
%
%
% % Processo iterativo
% while (numEstagiosEstagnados <= 10 && nfe < 1000),
%
%     % Crit�rios para mudan�a de temperatura
%     numAceites = 0;
%     numTentativas = 0;
%
%     % Fitness da solu��o submetida ao est�gio k
%     fevalin = jxbest;
%
%     while (numAceites < 12*n && numTentativas < 100*n),
%
%         % Gera uma solu��o na vizinhan�a de x
%         y = uniforme_mutation(x,ub,lb,sigma,xlimites,n);
%         %y = polynomial_mutation(x,ub,lb,xlimites,n);
%
%         jy  = feval(fobj, y);
%         nfe = nfe + 1;
%
%         % Atualiza solu��o
%         DeltaE = jy - jx;
%         if (DeltaE <= 0 || rand <= exp(-DeltaE/t)),
%             x  = y;
%             jx = jy;
%             numAceites = numAceites + 1;
%
%             % Atualiza melhor solu��o encontrada
%             if (jx < jxbest)
%                 xbest  = x;
%                 jxbest = jx;
%             end
%         end
%         numTentativas = numTentativas + 1;
%
%         % Armazena o caminho percorrido em dire��o ao �timo
%         caminho(size(caminho,1)+1,:) = [x' jx];
%
%         % Atualiza o percusso em dire��o ao �timo
%         output(fobj, caminho, size(caminho,1), xlimites);
%     end
%
%     % Atualiza o desvio padr�o da vizinhan�a
%     A = numAceites/numTentativas;
%     if (A > 0.20),
%         sigma = 1*sigma;
%     elseif (A < 0.05)
%         sigma = 1*sigma;
%     end
%
%     % Atualiza a temperatura
%     t = 0.9*t;
%
%     % Avalia crit�rio de estagna��o
%     if (jxbest < fevalin),
%         numEstagiosEstagnados = 0;
%     else
%         numEstagiosEstagnados = numEstagiosEstagnados + 1;
%     end
%
%     % Avalia crit�rio de reinicializa��o da temperatura
%     if (t < 1e-1),
%         t = to;
%     end
%
%     % Atualiza contador de est�gios de temperatura
%     k = k + 1;
% end
% fprintf('\n')
%
% figure
% plot(0:size(caminho,1)-1,caminho(:,end),'k-','linewidth',2)
% xlabel('N�mero de itera��es')
% ylabel('Valor da fun��o objetivo')
%
