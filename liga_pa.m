function [ C,D ] = liga_pa( idVpa,Vpa,Xc,Yc,Xpa,Ypa,C,D,prob )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

pC=C;


Vpa(idVpa)=1;
Nc=length(Xc);

for j=1:Nc
    D(idVpa,j)=sqrt((Xpa(idVpa)-Xc(j))^2+(Ypa(idVpa)-Yc(j))^2);
    if (D(idVpa,j)>85)
        pC(idVpa,j)=0;
    else
        if (rand()<prob)
            pC(:,j)=0;
            pC(idVpa,j)=1;
        end
    end
end



idc=find(pC(idVpa,:)==1);
tidc=length(idc);
if (tidc>0)
    for i=1:tidc
        j=idc(i);
        g=randi(tidc,1,1);
        pC(idVpa,j)=0;
        pC(id(g),j)=1;
    end
    end
end


end


C=pC;
Vpa(idVpa)=1;

end

