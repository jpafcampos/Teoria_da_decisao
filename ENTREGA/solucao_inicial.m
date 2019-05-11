function [ Xpa, Ypa, Vpa, C,D, gVpa ] = solucao_inicial(Xc,Yc,B)

%Dados iniciais do espaço.
Ai=800;
Aj=Ai;
fcor=1;
fcob=1;
rpa=85;
%Cálculo para distribuição uniforme em grid das PAs
Apa=pi*(rpa)^2;
nPA=(round(sqrt(round((Ai*Aj*fcob*fcor)/Apa)*2))+1)^2;
sPA=sqrt(nPA);
Xi=round(linspace(rpa/2*fcob,Ai-rpa/2*fcob,sqrt(nPA))); 
Yi=round(linspace(rpa/2*fcob,Ai-rpa/2*fcob,sqrt(nPA)));

%Incicalização das variáveis
Nc=length(Xc); %Número de clientes
Xpa=zeros(nPA,1); %Posição X da Pa
Ypa=zeros(nPA,1); %Posição Y da Pa
Vpa=ones(nPA,1); %Vetor de ativação da Pa
C=zeros(nPA,Nc); %Matriz de atendimento PA e cliente


k=1;
j=k;

%Cálculo posição PAs
for i=1:sPA
    for j=k:(k+sPA-1)
        Xpa(j)=Xi(i);
        Ypa(j)=Yi(j+1-k);
    end
    k=j+1;
end
gXpa=Xpa;
gYpa=Ypa;

D=zeros(nPA,Nc); %Distância de todas as PA's para clientes
pC=ones(nPA,Nc); %Possiveis PA's a atender um cliente
sB=zeros(nPA,1); %Soma da banda consumida na PA
sC=zeros(Nc,1); %Verificação de quantas PAs podem atender aquele cliente

%Calculo da distância e banda consumida na PA.
for i=1:nPA
    for j=1:Nc
        D(i,j)=sqrt((Xpa(i)-Xc(j))^2+(Ypa(i)-Yc(j))^2);
        if (D(i,j)>85)
            pC(i,j)=0;
        else
            sB(i)=sB(i)+B(j);
        end
    end
end
[ordsB,idsB]=sort(sB);

%Abordagem de inicio  que atende mais

% for i=1:nPA
%     id=idsB(i);
%     Vpa(id)=0;
%     aux=pC(id,:);
%     pC(id,:)=zeros(1,Nc);
%     flagerro=0;
%     
%     for j=1:Nc
%         sC(j)=sum(pC(:,j));
%         if (sC(j)<1)
%             pC(id,:)=aux;
%             Vpa(id)=1;
%             flagerro=1;
%             break;
%         end
%     end
%     if (flagerro==0)
%         gXpa(id)=0;
%         gYpa(id)=0;
%     end
% end



gVpa=zeros(1,Nc);

for j=1:Nc
    id=find(pC(:,j)==1);
    tid=length(id);
    if (tid>0)
        g=randi(tid,1,1);
        pC(:,j)=0;
        pC(id(g),j)=1;
        gVpa(j)=id(g);
    end
end
psize=30;


C=pC;
 
scatter(Xc(:), Yc(:), psize, gVpa(:));
colormap(prism(64))

hold on
scatter(gXpa(:), gYpa(:), psize,(1:64),'*');





end

