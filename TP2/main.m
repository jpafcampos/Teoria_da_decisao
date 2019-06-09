%Construção das matriz de pesos
sCriterios=['Número de PA', 'Distância', 'Clientes atendidos', 'Porcentagem média de banda utilizada'];
nCriterios=4;
MatrizPesos=[1,5,7,9];
MatrizPesos(2,:)=[1/MatrizPesos(1,2),1,3,7];
MatrizPesos(3,:)=[1/MatrizPesos(1,3),1/MatrizPesos(2,3),1,5];
MatrizPesos(4,:)=[1/MatrizPesos(1,4),1/MatrizPesos(2,3),1/MatrizPesos(3,4),1];
MatrizNormalizada=MatrizPesos;
Prioridade=zeros(nCriterios,1);
for i=1:nCriterios
MatrizNormalizada(:,i)=MatrizNormalizada(:,i)/sum(MatrizPesos(:,i));
end

for i=1:nCriterios
Prioridade(i)=mean(MatrizNormalizada(i,:));
end


