function [vbest, xbest, ybest, Cbest, fdist] = SAp4(alpha, Epsilon, Xc, Yc, B)

% Contador de estagios do metodo
%k = 0;

% Contador do numero de avaliacoes de f(.)
nfe = 0; 

% Gera solucao inicial
 
[Xpa,Ypa, Vpa, C,D] = solucao_inicial(Xc, Yc, B);

%solucao melhor recebe inicial
vbest = Vpa;
xbest = Xpa;
ybest = Ypa;
Cbest = C;

%solucao corrente:

v = Vpa;
x = Xpa;
y = Ypa;
xl = Xpa;
yl = Ypa;
vl = Vpa;
%coordenada que sofrera operacao de mudanca de posicao
viz = randi([4,6]);

% d da demanda!!!
fdist = Dist_total(v, C, x, y, Xc, Yc, B);


% Define temperatura inicial
[to,nfe] = initialT2(v, x, y, C, B,nfe,Xc,Yc,D);
tk = to;


%n de iteracoes executadas na linha K
mk = 10; 


% Criterio de parada do algoritmo
numEstagiosEstagnados = 0;
 

% Criterio de parada 
while (numEstagiosEstagnados <= 10 && nfe < 10000)    
    %contador
    m = 0;
    
    while m <= mk
        %Gere uma solucao xl E N(x)
        nPA = sum(v);
        indice = round((nPA-1)*rand()) + 1;
        
        if viz == 4
            [Cl,D,vl] =  Neighborhood(v, Xc,Yc, Xpa, Ypa, C, D,1); 
        end
        if viz == 5
           xindice = x(indice);
          [xfim, Cl,D,v] =  Neighborhood5(xindice, indice,v, Xc, Yc,x,y,C,D); %modifica o C tb n ï¿½ o indice da vizinhanï¿½a
          xl(indice) = xfim;
        end
        %A vizinhança 6 move o y com os mesmos parametros de x. 
         if viz == 6
           yindice = y(indice);
          [yfim, Cl,D,v] =  Neighborhood5(yindice, indice,v, Xc, Yc,x,y,C,D); %modifica o C tb n ï¿½ o indice da vizinhanï¿½a
          yl(indice) = yfim;
        end

     
        %atualiza o nfe
        nfe = nfe + 1;
        %Calculo Delta E
        DeltaE = Dist_total(v, Cl, xl, yl, Xc, Yc, B) - Dist_total(v, C, x, y, Xc, Yc, B);
        %DeltaE = numero_pa(vl,x,y, Xc, Yc,Cl,B) - numero_pa(v,x,y,Xc,Yc,C,B);
        
        if DeltaE <= 0 
             %Sol Corrente
             x = xl;
             C = Cl;
             y = yl;
             v = vl;
             %melhor solucao
             if Dist_total(vbest, Cbest, xbest, ybest,Xc,Yc,B) - Dist_total(v,C,x,y,Xc,Yc,B) > 0
                 vbest = v;
                 xbest = x;
                 ybest = y;
                 Cbest = C;
             end
             
             %Current Melhorou, zero o numero de estagnados
             numEstagiosEstagnados = 0;
        else
            if Aceite(DeltaE, tk ) %Funcao Aceite;
                C = Cl;
                x = xl;
                y = yl; 
                v = vl;
            end
            %current Melhorou, incremento a estagnados
            numEstagiosEstagnados = numEstagiosEstagnados + 1;
        end
            m = m + 1;
            fdist = Dist_total(vbest, Cbest, xbest, ybest,Xc,Yc,B);
    end

    

    tk = alpha*tk;
    
    if tk <= Epsilon
        tk = to;
    end

    
end
fdist = Dist_total(vbest, Cbest, xbest, ybest,Xc,Yc,B);
end
 
