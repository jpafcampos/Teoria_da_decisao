function [C,D,Vpa,X,Y ] = Neighborhood(vinit, Xc,Yc, Xpa, Ypa, C, D, r)
%Chamas as vizinhan�as quando conv�m

if(r == 1)
    [C,D,Vpa] = Neighborhood1(vinit, Xc,Yc, Xpa, Ypa, C, D);
    X = Xpa;
    Y = Ypa;
end

if(r == 2)
    [C,D,Vpa] = Neighborhood2(vinit, Xc,Yc, Xpa, Ypa, C, D);   
    X = Xpa;
    Y = Ypa;
end

if(r == 3)
    [C,D,Vpa] = Neighborhood3(vinit, Xc,Yc, Xpa, Ypa, C, D);
    X = Xpa;
    Y = Ypa;
end

if(r == 4)
    [C,D,Vpa] = Neighborhood4(vinit, Xc,Yc, Xpa, Ypa, C, D);
    X = Xpa;
    Y = Ypa;
end

end

