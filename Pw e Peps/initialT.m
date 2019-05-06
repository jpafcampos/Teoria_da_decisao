%==========================================================================
% Universidade Federal de Minas Gerais
% Escola de Engenharia da UFMG
% Depto. de Engenharia Elétrica
%
% Autor:
%   Lucas S. Batista
%
% Atualização: 27/09/2018
%
% Nota:
%   Define a temperatura inicial.
% =========================================================================


function [to,x,jx,nfe] = initialT(fobj,x,ub,lb,sigma,xlimites,nfe,n)

N   = 100;      % número de testes
tau = 0.20;     % taxa de aceitação inicial
X   = zeros(N,n);
jX  = zeros(N,1);

x   = boxConstraints(x(:), xlimites);
jx  = feval(fobj,x);
nfe = nfe + 1;
X(1,:) = x(:).';
jX(1)  = jx;

i = 1;
DeltaE = 100;
for k = 2:N,
    %y = uniforme_mutation(x,ub,lb,sigma,xlimites,n);
    y = polynomial_mutation(x,ub,lb,xlimites,n);
    X(k,:) = y(:).';
        
    jX(k) = feval(fobj,X(k,:));
    nfe = nfe + 1; 
    
    DE = jX(k) - jx;
    if DE > 0,
        DeltaE(i) = DE;
        i = i + 1;
    end
end

[fmin,jmin] = min(jX);
x  = X(jmin,:);
x  = x(:);
jx = fmin;

DeltaEM = mean(DeltaE);
to = - DeltaEM/log(tau);


