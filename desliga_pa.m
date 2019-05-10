function [ nC,nD, nVpa,ngVpa ] = desliga_pa( idVpa,Vpa,Xc,Yc,Xpa,Ypa,C,D,gVpa)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
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

psize=30;

scatter(Xc(:), Yc(:), psize, gVpa(:));
colormap(prism(64))
%colormap(flag(64))

hold on
scatter(gXpa(:), gYpa(:), psize,(1:64),'*');




end

