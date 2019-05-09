function [ Xpa, Ypa, Vpa, C ] = inicio_sol(Xc,Yc,B)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
Nc=length(Xc);


Ai=800;
Aj=Ai;
fcor=1;
fcob=1;
rpa=85;
Apa=pi*(rpa)^2;
nPA=(round(sqrt(round((Ai*Aj*fcob*fcor)/Apa)*2))+1)^2;
sPA=sqrt(nPA);
Xi=round(linspace(rpa/2*fcob,Ai-rpa/2*fcob,sqrt(nPA)));
Yi=round(linspace(rpa/2*fcob,Ai-rpa/2*fcob,sqrt(nPA)));
Xpa=zeros(nPA,1);
Ypa=zeros(nPA,1);
Vpa=ones(nPA,1);
C=zeros(nPA,Nc);

k=1;
j=k;



for i=1:sPA
    for j=k:(k+sPA-1)
        Xpa(j)=Xi(i);
        Ypa(j)=Yi(j+1-k);
    end
    k=j+1;
end

D=zeros(nPA,Nc);
pC=ones(nPA,Nc);
sB=zeros(nPA,1);
sC=zeros(Nc,1);
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

%Abordagem de inicio pelos que atende mais

for i=1:nPA
    id=idsB(i);
    Vpa(id)=0;
    aux=pC(id,:);
    pC(id,:)=zeros(1,Nc);
    flagerro=0;
    
    for j=1:Nc
        sC(j)=sum(pC(:,j));
        if (sC(j)<1)
            pC(id,:)=aux;
            Vpa(id)=1;
            flagerro=1;
            break;
        end
    end
    if (flagerro==0)
        Xpa(id)=0;
        Ypa(id)=0;
    end
end



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

% [vord,vid]=sort(gVpa);
%  vrand=gVpa(randperm(length( gVpa)));
% [vrord,vrid]=sort(vrand);
% [Bs, Bi] = sort(B(:, 1));
% ABi(vrid) = Bi;


 
scatter(Xc(:), Yc(:), psize, gVpa(:));
colormap(prism(64))
%colormap(flag(64))

hold on
scatter(Xpa(:), Ypa(:), psize,(1:64),'*');


% 
% hold on
% plot(Xpa,Ypa,'r*');



end

