function [ nC,nD,nVpa ] = desloca_y( idVpa,Vpa,Xc,Yc,Xpa,Ypa,C,D,delta)
   [ nC,nD, nVpa ]=desliga_pa( idVpa,Vpa,Xc,Yc,Xpa,Ypa,C,D);
    Ypa(idVpa)=Ypa(idVpa)+delta;
    [ nC,nD, nVpa ]=liga_pa( idVpa,nVpa,Xc,Yc,Xpa,Ypa,nC,nD);

end

