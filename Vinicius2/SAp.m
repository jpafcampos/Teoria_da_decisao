function [vbest, xbest, ybest, Cbest, fPA] = SAp(alpha, Epsilon, Xc, Yc, B)

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

%solu��o melhor recebe inicial
vbest = Vpa;
xbest = Xpa;
ybest = Ypa;
Cbest = C;
fPA = numPA;

%plot
fbest_hist = fPA;
fcurrent_hist = fPA;

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
while (numEstagiosEstagnados <= 10 && nfe < 10000)    
    %contador
    m = 0;
    
    while m <= mk
        %Gere uma solucao xl E N(x)
        % vizinhan�as ordenadas
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
             %Sol Corrente, boas s�o sempre aceitas
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
            if Aceite(DeltaE, tk ) == 1
                v = vl;
                C = Cl; 
            end
            %current n�o melhorou, incremento a estagnados
            numEstagiosEstagnados = numEstagiosEstagnados + 1;
        end
            m = m + 1;
            fPA = numero_pa(vbest, xbest, ybest,Xc,Yc, Cbest,B);
            fcPA = numero_pa(v,x,y,Xc,Yc,C,B);
            fcurrent_hist = [fcurrent_hist fcPA];
            fbest_hist = [fbest_hist fPA];
    end

     
    tk = alpha*tk;
    
    if tk <= Epsilon
        tk = to;
    end
    %k = k + 1;
end
    fPA = numero_pa(vbest, xbest, ybest,Xc,Yc, Cbest,B);
    fbest_hist = [fbest_hist fPA];
    
    %plot
    plot(fbest_hist,'r')
    hold on 
    plot(fcurrent_hist, 'k')
    hold off
    xlabel('N�mero de itera��es')
    ylabel('N�mero de PAs')
end
