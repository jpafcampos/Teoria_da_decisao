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





C=pC;
end

