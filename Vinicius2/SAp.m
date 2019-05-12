function [vbest, xbest, ybest, Cbest, fPa] = SAp(alpha, Epsilon, Xc, Yc, B)

% Contador de estagios do metodo
%k = 0;

% Contador do numero de avaliacoes de f(.)
nfe = 0; 

% Gera solucao inicial
 
[Xpa,Ypa, Vpa, C,D] = solucao_inicial(Xc, Yc, B);


%solucao corrente:

v = Vpa;
x = Xpa;
y = Ypa;


%Numero inicial de PAs 
numPA = numero_pa(v, x, y, Xc, Yc, C, B);

%solução melhor recebe inicial
vbest = Vpa;
xbest = Xpa;
ybest = Ypa;
Cbest = C;
fPa = numPa;

% Define temperatura inicial
[to,nfe] = initialT(v, x, y, C, B,nfe,Xc,Yc,D);
tk = to;

%n de iteracoes executadas na linha K
mk = 10; 


%numero minimo de PA
min_num_PA = 33;


viz = 1;

% Criterio de parada do algoritmo
 numEstagiosEstagnados = 0;
 


% Criterio de parada 
while (numEstagiosEstagnados <= 10 && nfe < 10000 && numPA > min_num_PA)    
    %contador
    m = 0;
    
    while m <= mk
        %Gere uma solucao xl E N(x)
        % vizinhanças ordenadas
        if viz == 5
            viz =1;
        end
        [Cl,D,vl] =  Neighborhood(v, Xc,Yc, Xpa, Ypa, C, D,viz); 
        %muda a vizinhanca pra perturbacao
        viz = viz + 1;
        %atualiza o nfe
        nfe = nfe + 1;
        
        
        %Calculo Delta E
        DeltaE = numero_pa(vl,x,y, Xc, Yc,Cl,B) - numero_pa(v,x,y,Xc,Yc,C,B);
        
        if DeltaE <= 0 
             %Sol Corrente
             v = vl;
             C = Cl;
             
             %melhor sol
             if numero_pa(vbest, xbest, ybest,Xc,Yc, Cbest,B) - numero_pa(v,x,y,Xc,Yc,C,B) > 0
                 vbest = v;
                 xbest = x;
                 ybest = y;
                 Cbest = C;
             end
             
             %Current Melhorou, zero o n de estagnados
             numEstagiosEstagnados = 0;
        else
            if Aceite(DeltaE, tk ) 
                v = vl;
                C = Cl;
                x = xl;
                y = yl; 
            end
            %current Melhorou, incremento a estagnados
            numEstagiosEstagnados = numEstagiosEstagnados + 1;
        end
            m = m + 1;
            fPa = numero_pa(vbest, xbest, ybest,Xc,Yc, Cbest,B);
    end

    
    %Usar o Geomï¿½trico 
    tk = alpha*tk;
    
    if tk <= Epsilon
        tk = to;
    end
    %k = k + 1;
end
    fPa = numero_pa(vbest, xbest, ybest,Xc,Yc, Cbest,B);
end