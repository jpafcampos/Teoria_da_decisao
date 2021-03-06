function [VetorResultado, Ranking ] = hap1( MatrizCandidatos,PrioridadeGeral )

T=size(MatrizCandidatos);
PrioridadeCriterio=zeros(T(1),T(2));
VetorResultado=zeros(T(1),1);
for k=1:T(2)
    C1=MatrizCandidatos(:,k);
    MatrizC1=zeros(T(1),T(1));
    
    for i=1:T(1)
        for j=1:T(1)
            MatrizC1(i,j)=C1(i)/C1(j);
        end
    end
    MatrizNormalizada=MatrizC1;
    for i=1:T(1)
        MatrizNormalizada(:,i)=MatrizNormalizada(:,i)/sum(MatrizC1(:,i));
    end
    
    for i=1:T(1)
        PrioridadeCriterio(i,k)=mean(MatrizNormalizada(i,:));
    end
    
end
MatrizPrioridade=PrioridadeCriterio;
for i=1:T(2)
    MatrizPrioridade(:,i)=PrioridadeCriterio(:,i)*PrioridadeGeral(i);
end

for i=1:T(1)
    VetorResultado(i)=sum(MatrizPrioridade(i,:));
end
[~, Ranking]=sort(VetorResultado);

end

