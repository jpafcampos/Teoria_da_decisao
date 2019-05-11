function [ nC,nD, nVpa,ngVpa ] = desliga_pa( idVpa,Vpa,Xc,Yc,Xpa,Ypa,C,D,gVpa)


%Inicialização das variáveis
nC=C;
nD=D;
nVpa=Vpa;
ngVpa=gVpa;
nPA=length(Xpa);
Nc=length(Xc);
pC=ones(nPA,Nc);


for i=1:nPA
    for j=1:Nc
        D(i,j)=sqrt((Xpa(i)-Xc(j))^2+(Ypa(i)-Yc(j))^2);
        if (D(i,j)>85)
            pC(i,j)=0;
        end
    end
    if (Vpa(i)==0)
       pC(i,:)=0;
    end
end


id=find(C(idVpa,:)==1);
tid=length(id);
pC(idVpa,:)=0;
nC(idVpa,:)=pC(idVpa,:);


if (tid>0)
    for i=1:tid
        j=id(i);
        idc=find(pC(:,j)==1);
        tidc=length(idc);
        gVpa(j)=0;
        if (tidc>0)
            g=randi(tidc,1,1);
            
            pC(:,j)=0;
            nC(:,j)=pC(:,j);
            pC(idc(g),j)=1;
            nC(idc(g),j)=pC(idc(g),j);
            gVpa(j)=id(g);
        end
    end
end

nVpa(idVpa)=0;

gXpa=Xpa;
gYpa=Ypa;
for i=1:nPA
gXpa(i)=Xpa(i)*nVpa(i);
gYpa(i)=Ypa(i)*nVpa(i);
end

% figure(2)
% psize=30;
 ngVpa=gVpa;
% scatter(Xc(:), Yc(:), psize, gVpa(:));
% colormap(prism(nPA))
% hold on
% scatter(gXpa(:), gYpa(:), psize,(1:64),'*');




end

