function [ nC,nD,nVpa ] = desloca_x( idVpa,Vpa,Xc,Yc,Xpa,Ypa,C,D,delta)
[ nC,nD, nVpa ]=desliga_pa( idVpa,Vpa,Xc,Yc,Xpa,Ypa,C,D);
Xpa(idVpa)=Xpa(idVpa)+delta;
if (Xpa(idVpa)>800)
    Xpa(idVpa)=800;
end
if (Xpa(idVpa)<0)
    Xpa(idVpa)=0;
end
[ nC,nD, nVpa ]=liga_pa( idVpa,nVpa,Xc,Yc,Xpa,Ypa,nC,nD);

end

