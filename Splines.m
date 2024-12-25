function [A,C]= Splines (Data) 
x=Data(:,1);
y=Data(:,2);
nSplines=size(Data,1)-1; % number of splines 
% coefficient matrix of zeros 
for i=1:3*nSplines
    for j=1:3*nSplines
        A(i,j)=0;
    end
end
%--adjusting the correct indices places in A coefficient matrix 
%---Rule 1 (2n equations)
counter1=4; % shift among rows in coefficienf matrix for inidices~=0
i=2; % index for x points used 
for ii=1:2:2*nSplines
        if ii==1
            % two iteration for row 1&2
            for kk=ii:ii+1
            A(kk,1)=x(kk)^2;
            A(kk,2)=x(kk);
            A(kk,3)=1;
            end
            % rows 3, 4 or above
        elseif ii>2
            j=i;
            % two iterations for each two consecutive rows 
            for jj=ii:ii+1
                A(jj,counter1)=x(j)^2;
                A(jj,counter1+1)=x(j);
                A(jj,counter1+2)=1;
                j=j+1;
            end
            counter1=counter1+3; % shift to move next 3 indices after two iterations
            i=i+1; % index for the x point used 
        end      
end
%---Rule 2
counter2=1; % index for column and also for shift among rows 
m=2; %index for x point used
for nn=2*nSplines+1:3*nSplines-1
    A(nn,counter2)=2*x(m);
    A(nn,counter2+1)=1;
    A(nn,counter2+3)=-2*x(m);
    A(nn,counter2+4)=-1;
    counter2=counter2+3; % shift for next row in the matrix
    m=m+1;
end
%--rule 3
A(3*nSplines,1)=1;

%----Constant Matrix
counter3=2; % index for x points
n=(size(y,1)-2)*2; % Number repeated indices in constant matrix
for ee=2:2:3*nSplines
if ee>1 & ee<=n+2
        for bb=ee:ee+1 % two iterations to repeat y values of interior points (x)
        C(bb,1)=y(counter3);
        end
end
counter3=counter3+1;
end
% 1st index, n+2 index, and rest of C matrix for final format of C matrix 
for tt=1:3*nSplines
    if tt==n+2
        C(tt,1)=y(end);
    elseif tt==1
        C(tt,1)=y(1);
    elseif tt>n+2
        C(tt,1)=0;
    end
end
end