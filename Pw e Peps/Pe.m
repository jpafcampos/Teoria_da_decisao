%
% Estrat�gia eps-Restrito Pe
%

clear all
close all
clc


fobj = @fobj1;  % problema de otimiza��o multiobjetivo
n = 2;          % n�mero de vari�veis de decis�o
m = 2;          % n�mero de objetivos

nef  = 1000;
xlim = repmat([0 1],1,n);
lb = xlim(1:2:end);
ub = xlim(2:2:end);


% Determina a solu��o ut�pica (aproximada) usando Pw
I = eye(m);
for k = 1:m
    xo = rand(n,1);
    w  = I(:,k);
    X(:,k)  = SAreal(@(x) problemaPw(fobj,x,w), xo, xlim);
    jX(:,k) = fobj(X(:,k));    
end
eps = [ min(jX,[],2) max(jX,[],2) ];


xo = (ub(:)-lb(:)).*rand(n,1) + lb(:);  % gera solu��o inicial

for i = 1:100,   % n�mero de solu��es Pareto-�timas ESTIMADAS
    
    e = (eps(:,2)-eps(:,1)).*rand(m,1) + eps(:,1);
    
    X(:,i) = SAreal(@(x) problemaPe(fobj,x,e), xo, xlim);
     
    %options = saoptimset('MaxFunEvals', 100, 'Display', 'off');
    %X(:,i) = simulannealbnd(@(x) problemaPe(fobj,x,e), xo, lb, ub, options);
        
    jX(:,i) = fobj(X(:,i));
    
    xo = X(:,i);
    
end

% Plota espa�o de objetivos se m = 2 ou m = 3
if m == 2
    plot(jX(1,:),jX(2,:),'ro')
    xlabel('f1'), ylabel('f2')    
elseif m == 3
    plot3(jX(1,:),jX(2,:),jX(3,:), 'ro')
    xlabel('f1'), ylabel('f2'), zlabel('f3')
    box on
end

% Plota espa�o de decis�o se n = 2 ou n = 3
if n == 2
    figure
    plot(X(1,:),X(2,:),'ro')
    xlabel('x1'), ylabel('x2')      
elseif n == 3
    figure
    plot3(X(1,:),X(2,:),X(3,:), 'ro')
    xlabel('x1'), ylabel('x2'), zlabel('x3')
    box on
end

