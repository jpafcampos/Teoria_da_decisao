function [vbest, xbest, ybest, Cbest] = SAp(alpha, Epsilon, Xc, Yc, B)

% Contador de est�gios do m�todo
%k = 0;

% Contador do n�mero de avalia��es de f(.)
nfe = 0; 

% Gera solu��o inicial
 
[Xpa,Ypa, Vpa, C,D, gVpa] = inicio_sol(Xc, Yc, B);
vbest = Vpa;
xbest = Xpa;
ybest = Ypa;
Cbest = C;

%N�mero inicial de PA. NAP � a fun��o objetivo para este problema
%[numPA] = NPA(v, x, y, Xc, Yc C, d)
numPA = NPA(Vpa, Xpa, Ypa, Xc, Yc, C, B);


% Define temperatura inicial
%[to, nfe] = initialT(v, x, y, C, d,nfe);
to = 31;
nfe = 0;
tk = to;
%n de itera��es executadas na linha K
mk = 50; 


%n�mero m�nimo de PA
min_num_PA = 26;




% Crit�rio de parada do algoritmo
 numEstagiosEstagnados = 0;
 


% Crit�rio de parada 
while (numEstagiosEstagnados <= 10 && nfe < 1000 && numPA > min_num_PA)
    
    %contador
    m = 0;
    
    while m <= mk
        %Gere uma solu��o xl E N(x)
        %Neighborhood1(Vinit,Xc,Yc,Xpa,Ypa,C,D)
        [vl, Cl, D, ngVpa] =  Neighborhood1(Vpa,Xc,Yc,Xpa, Ypa,C,D, gVpa); %modifica o C tb n � o indice da vizinhan�a
        
        %atualiza o nfe
        nfe = nfe + 1
        %C�lculo Delta E
        %[numPA] = NPA(v, x, y, Xc, Yc C, d)
        DeltaE = NPA(vl,Xpa,Ypa, Xc, Yc,Cl,B) - NPA(Vpa,Xpa,Ypa,Xc,Yc,C,B);
        
        if DeltaE <= 0 
             %Sol Corrente
             v = vl;
             C = Cl;
             x = Xpa;
             y = Ypa;
             %melhor solu��o
             if NPA(vbest, xbest, ybest,Xc,Yc, Cbest,B) - NPA(v,x,y,Xc,Yc,C,B) > 0
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
    end

    
    %Usar o Geom�trico 
    tk = alpha*tk;
    
    if tk <= Epsilon
        tk = to;
    end
    %k = k + 1;
end
    
end