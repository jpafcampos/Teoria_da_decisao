function [ nC,nD, nVpa ] = liga_pa( idVpa,Vpa,Xc,Yc,Xpa,Ypa,C,D)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

nC=C;
nD=D;
nVpa=Vpa;

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



id=find(pC(idVpa,:)==1);
tid=length(id);
nC(idVpa,:)=pC(idVpa,:);


if (tid>0)
    for i=1:tid
        j=id(i);
        pC(:,j)=0;
        pC(idVpa,j)=1;
        nC(:,j)=pC(:,j);
    end
end

nVpa(idVpa)=1;
nD=D;

end

