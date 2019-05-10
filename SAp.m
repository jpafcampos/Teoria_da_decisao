function [vbest, xbest, ybest, Cbest] = SAp(d, alpha, Epsilon)

% Contador de est�gios do m�todo
%k = 0;

% Contador do n�mero de avalia��es de f(.)
nfe = 0; 

% Gera solu��o inicial
[v,x,y,C] = Sol_inic();

%N�mero inicial de PA. NAP � a fun��o objetivo para este problema
numPA = NPA(v, x, y, C, d);


% Define temperatura inicial
[to, nfe] = initialT(v, x, y, C, d,nfe);


%n de itera��es executadas na linha K
mk = 0; 


%n�mero m�nimo de PA
min_num_PA = 40;




% Crit�rio de parada do algoritmo
 numEstagiosEstagnados = 0;
 


% Crit�rio de parada 
while (numEstagiosEstagnados <= 10 && nfe < 10000 && numPA > min_num_PA)
    
    %contador
    m = 0;
    
    while m <= Mk
        %Gere uma solu��o xl E N(x)
        [vl,xl,yl, Cl] =  Neighborhood(v,x,y,C,n); %modifica o C tb n � o indice da vizinhan�a
        
        %atualiza o nfe
        nfe = nfe + 1;
        %C�lculo Delta E
        DeltaE = NPA(vl,xl,yl,Cl,d) - NPA(v,x,y,C,d);
        
        if DeltaE <= 0 
             %Sol Corrente
             v = vl;
             C = Cl;
             x = xl;
             y = yl;
             %melhor solu��o
             if NPA(vbest, xbest, ybest, Cbest,d) - NPA(v,x,y,C,d) > 0
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
    end
    m = m + 1;
    
    %Usar o Geom�trico 
    tk = alpha*tk;
    
    if tk <= Epsilon
        tk = to;
    end
    %k = k + 1;
end
    
end