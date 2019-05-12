function [vbest, xbest, ybest, Cbest, f] = SA_eps_restrito(alpha, Epsilon, Xc, Yc, B, w)

% Contador de est�gios do m�todo
%k = 0;

% Contador do n�mero de avalia��es de f(.)
nfe = 0; 

% Gera solu��o inicial
 
[Xpa,Ypa, Vpa, C,D] = solucao_inicial(Xc, Yc, B);

%solu��o melhor recebe inicial
vbest = Vpa;
xbest = Xpa;
ybest = Ypa;
Cbest = C;

%solu��o corrente:

v = Vpa;
x = Xpa;
y = Ypa;



%function [dist] = Dist_total(v, C, x, y, xc, yc, d) d é a demanda!!!
[f] = fobj_somaponderada(v, C, x, y, Xc, Yc, B, w);


% Define temperatura inicial
%[to, nfe] = initialT(v, x, y, C, d,nfe);
to = 31;
nfe = 0;
tk = to;
%n de itera��es executadas na linha K
mk = 10; 


% Crit�rio de parada do algoritmo
 numEstagiosEstagnados = 0;
 
operacao = 1;
% Crit�rio de parada 
while (numEstagiosEstagnados <= 10 && nfe < 100)    
    %contador
    m = 0;
    
    while m <= mk
        %Gere uma solu��o xl E N(x)
        %[ Xfim, Cl] = Neighborhood5 (Xinit, C)
        if operacao == 5
            indice = round(63*rand()) +1;
           xindice = x(indice);
          [xfim, Cl,D,vl] =  Neighborhood5(xindice, indice,v, Xc, Yc,x,y,C,D); %modifica o C tb n � o indice da vizinhan�a
          yl = y;
          xl = x;
          xl(indice) = xfim;
          operacao = 1;
        elseif operacao == 6
            indice = round(rand(63)) +1;
           yindice = x(indice);
          [yfim, Cl,D,vl] =  Neighborhood5(yindice, indice,v, Xc, Yc,x,y,C,D); %modifica o C tb n � o indice da vizinhan�a
          yl = y;
          xl = x;
          yl(indice) = yfim;
          operacao = 1;
         else
          [Cl,D,vl] =  Neighborhood(v, Xc,Yc, Xpa, Ypa, C, D,1);
          operacao = operacao + 1;
          xl = x;
          yl = y;
 
        end
        %atualiza o nfe
        nfe = nfe + 1;
        %C�lculo Delta E
        DeltaE = fobj_somaponderada(vl, Cl, xl, yl, Xc, Yc, B, w) -fobj_somaponderada(v, C, x, y, Xc, Yc, B, w);
        %DeltaE = numero_pa(vl,x,y, Xc, Yc,Cl,B) - numero_pa(v,x,y,Xc,Yc,C,B);
        
        if DeltaE <= 0 
             %Sol Corrente
             y = yl;
             x = xl;
             C = Cl;
             v = vl;
             %melhor solu��o
             if fobj_somaponderada(vbest, Cbest, xbest, ybest, Xc, Yc, B, w) - fobj_somaponderada(v, C, x, y, Xc, Yc, B, w) > 0
                 vbest = v;
                 xbest = x;
                 ybest = y;
                 Cbest = C;
             end
             
             %Current Melhorou, zero o n�mero de estagnados
             numEstagiosEstagnados = 0;
        else
            if Aceite(DeltaE, tk ) %Fun��o Aceite
                v = vl;
                C = Cl;
                x = xl;
                y = yl; 
            end
            %current Melhorou, incremento a estagnados
            numEstagiosEstagnados = numEstagiosEstagnados + 1;
        end
            m = m + 1;
            f = fobj_somaponderada(vbest, Cbest, xbest, ybest, Xc, Yc, B, w);
    end

    
    %Usar o Geom�trico 
    tk = alpha*tk;
    
    if tk <= Epsilon
        tk = to;
    end
    %k = k + 1;
end
f = fobj_somaponderada(vbest, Cbest, xbest, ybest, Xc, Yc, B, w);
end