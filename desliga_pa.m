function [ C,D ] = desliga_pa( idVpa,Vpa,Xc,Yc,Xpa,Ypa,C,D)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
newC=C;
pC=newC;

nPA=length(Xpa);
Nc=length(Xc);

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
pC(idVpa,:)=0;

if (tid>0)
    for i=1:tid
        j=id(i);
        idc=find(pC(:,j)==1);
        tidc=length(idc);
        if (tidc>0)
            g=randi(tidc,1,1);
            pC(idVpa,j)=0;
            pC(id(g),j)=1;
        end
    end
end
% for j=1:Nc
%     id=find(pC(:,j)==1);
%     tid=length(id);
%     if (tid>0)
%         g=randi(tid,1,1);
%         pC(:,j)=0;
%         pC(id(g),j)=1;
%     end
% end


end

