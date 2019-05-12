function [vbest, xbest, ybest, Cbest, fpa] = SAp(alpha, Epsilon, Xc, Yc, B)

% Contador de estï¿½gios do mï¿½todo
%k = 0;

% Contador do nï¿½mero de avaliaï¿½ï¿½es de f(.)
nfe = 0; 

% Gera soluï¿½ï¿½o inicial
 
[Xpa,Ypa, Vpa, C,D] = solucao_inicial(Xc, Yc, B);

%solução melhor recebe inicial
vbest = Vpa;
xbest = Xpa;
ybest = Ypa;
Cbest = C;

%solução corrente:

v = Vpa;
x = Xpa;
y = Ypa;


%Nï¿½mero inicial de PA. NAP ï¿½ a funï¿½ï¿½o objetivo para este problema
%[numPA] = numero_pa(v, x, y, Xc, Yc C, d)
numPA = numero_pa(v, x, y, Xc, Yc, C, B);


% Define temperatura inicial
%[to, nfe] = initialT(v, x, y, C, d,nfe);
to = 31;
tk = to;
%n de iteraï¿½ï¿½es executadas na linha K
mk = 10; 


%nï¿½mero mï¿½nimo de PA
min_num_PA = 33;


viz = 1;

% Critï¿½rio de parada do algoritmo
 numEstagiosEstagnados = 0;
 


% Critï¿½rio de parada 
while (numEstagiosEstagnados <= 10 && nfe < 100 && numPA > min_num_PA)    
    %contador
    m = 0;
    
    while m <= mk
        %Gere uma soluï¿½ï¿½o xl E N(x)
        % viszinhanças ordenadas
        if viz == 5
            viz =1;
        end
        [Cl,D,vl] =  Neighborhood(v, Xc,Yc, Xpa, Ypa, C, D,viz); %modifica o C tb n ï¿½ o indice da vizinhanï¿½a
        viz = viz + 1;
        %atualiza o nfe
        nfe = nfe + 1;
        %Cï¿½lculo Delta E

        DeltaE = numero_pa(vl,x,y, Xc, Yc,Cl,B) - numero_pa(v,x,y,Xc,Yc,C,B);
        
        if DeltaE <= 0 
             %Sol Corrente
             v = vl;
             C = Cl;
             
             %melhor soluï¿½ï¿½o
             if numero_pa(vbest, xbest, ybest,Xc,Yc, Cbest,B) - numero_pa(v,x,y,Xc,Yc,C,B) > 0
                 vbest = v;
                 xbest = x;
                 ybest = y;
                 Cbest = C;
             end
             
             %Current Melhorou, zero o nï¿½mero de estagnados
             numEstagiosEstagnados = 0;
        else
            if Aceite(DeltaE, tk ) %Funï¿½ï¿½o Aceite
                v = vl;
                C = Cl;
                x = xl;
                y = yl; 
            end
            %current Melhorou, incremento a estagnados
            numEstagiosEstagnados = numEstagiosEstagnados + 1;
        end
            m = m + 1
            fpa = numero_pa(vbest, xbest, ybest,Xc,Yc, Cbest,B);
    end

    
    %Usar o Geomï¿½trico 
    tk = alpha*tk;
    
    if tk <= Epsilon
        tk = to;
    end
    %k = k + 1;
end
    fpa = numero_pa(vbest, xbest, ybest,Xc,Yc, Cbest,B);
end