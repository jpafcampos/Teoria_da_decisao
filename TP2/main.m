%Construção das matriz de pesos
clear all
sol = ...
  [28 25212.718533046776 0.976 78.923992;
   29 24391.680869004915 0.992 60.028025000000007;
   34 23702.176059187877 0.988 47.10124;
   39 22271.383728665267 0.982 56.801011;
   41 21066.912788484646 0.986 52.982693;
   46 19796.92213818492 0.994 51.693423;
   44 18722.024406456432 0.974 62.584965000000004;
   50 17572.470519005314 0.984 66.921523;
   56 16207.389940555264 0.996 45.087979000000004];

sCriterios=['Número de PA', 'Distância', 'Clientes atendidos', 'Banda máxima'];
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

MatrizCandidatos=sol;
MatrizCandidatos(:,3)=1-sol(:,3);


Ranking = hap1( MatrizCandidatos,Prioridade );