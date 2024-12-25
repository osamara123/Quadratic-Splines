function Length=Calculate(X,Data)
x=Data(:,1);
nSplines=size(Data,1)-1;
% a,b,c arrays seprated
% for instance a=[a1,a2,a3, ....]
counter4=1;
counter5=2;
counter6=3;
for dd=1:nSplines
    a(dd)=X(counter4);
    b(dd)=X(counter5);
    c(dd)=X(counter6);
    counter4=counter4+3;
    counter5=counter5+3;
    counter6=counter6+3;
end
% Length of the curve 
% l(index) of each interval separated
for ff=1:nSplines
    %linear spline
    if ff==1
        L(ff)=(sqrt(1+b(ff)^2)).*(x(2)-x(1));
    end
    % quadratic splines lengths
    if ff>1
        L(ff)=(1/(4*a(ff)))*((sqrt((2*a(ff)*(x(ff+1))+b(ff))^2+1))*(2*a(ff)*(x(ff+1))+b(ff))+asinh((2*a(ff)*(x(ff+1))+b(ff))))-(1/(4*a(ff)))*((sqrt((2*a(ff)*(x(ff))+b(ff))^2+1))*(2*a(ff)*(x(ff))+b(ff))+asinh((2*a(ff)*(x(ff))+b(ff))));
    end
end
Length=sum(L);
end