function [ Ranking ] = hap1( MatrizCandidatos,Prioridade )

MatrizAval=MatrizCandidatos;
for i=1:length(Prioridade)
    MatrizAval(:,i)=MatrizCandidatos(:,i)*Prioridade(i);
end

T=size(MatrizCandidatos);
Result=zeros(T(1),1);
for i=1:T(1)
    Result(i)=mean(MatrizAval(i,:));
end

[~, Ranking]=sort(Result);

end

