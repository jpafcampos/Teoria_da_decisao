function [vbest, xbest, ybest, Cbest] = SAp(d, alpha, Epsilon)

% Contador de estágios do método
%k = 0;

% Contador do número de avaliações de f(.)
nfe = 0; 

% Gera solução inicial
[v,x,y,C] = Sol_inic();

%Número inicial de PA. NAP é a função objetivo para este problema
numPA = NPA(v, x, y, C, d);


% Define temperatura inicial
[to, nfe] = initialT(v, x, y, C, d,nfe);


%n de iterações executadas na linha K
mk = 0; 


%número mínimo de PA
min_num_PA = 40;




% Critério de parada do algoritmo
 numEstagiosEstagnados = 0;
 


% Critério de parada 
while (numEstagiosEstagnados <= 10 && nfe < 10000 && numPA > min_num_PA)
    
    %contador
    m = 0;
    
    while m <= Mk
        %Gere uma solução xl E N(x)
        [vl,xl,yl, Cl] =  Neighborhood(v,x,y,C,n); %modifica o C tb n é o indice da vizinhança
        
        %atualiza o nfe
        nfe = nfe + 1;
        %Cálculo Delta E
        DeltaE = NPA(vl,xl,yl,Cl,d) - NPA(v,x,y,C,d);
        
        if DeltaE <= 0 
             %Sol Corrente
             v = vl;
             C = Cl;
             x = xl;
             y = yl;
             %melhor solução
             if NPA(vbest, xbest, ybest, Cbest,d) - NPA(v,x,y,C,d) > 0
                 vbest = v;
                 xbest = x;
                 ybest = y;
                 Cbest = C;
             end
             
             %Current Melhorou, zero o número de estagnados
             numEstagiosEstagnados = 0;
        else
            if Aceite(DeltaE, tk ) %Função Aceite
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
    
    %Usar o Geométrico 
    tk = alpha*tk;
    
    if tk <= Epsilon
        tk = to;
    end
    %k = k + 1;
end
    
end