function [C,D,Vpa,X,Y ] = Neighborhood(vinit, Xc,Yc, Xpa, Ypa, C, D, r)
%Chamas as vizinhanças quando convém

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

if(r == 5)
    [C,D,Vpa,X,Y] = Neighborhood5(vinit, Xc,Yc, Xpa, Ypa, C, D);
end

if(r == 6)
    [C,D,Vpa,X,Y] = Neighborhood6(vinit, Xc,Yc, Xpa, Ypa, C, D);
end

end

