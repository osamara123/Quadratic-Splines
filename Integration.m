function L2= Integration (Data,Y2)
x=Data(:,1);
%---h values
for ii=1:1000
    if ii>=1 & ii<= length(x)-1
    h(ii)=x(ii+1)-x(ii);
    end
    if ii>length(x)-1
        h(ii)=0;
    end
end
counter1=1; %----counter for h values
counter2=1; %-----counter for x values
counter3=1; %------counter for Integration
if length(h)>2
    for jj=1:length(x)-1
         if counter1==length(x)-1
              %trapezoidal
             I(counter3)=(Y2(counter2)+Y2(counter2+1))/(2).*h(counter1);
             counter1=counter1+1;
            break;
         end
         if counter1>length(x)-1
                break;
         end   
        if h(counter1)==h(counter1+1) && h(counter1+1)==h(counter1+2)
            %simpson 3/8
            I(counter3)=(3*h(counter1)/8)*(Y2(counter2)+3*(Y2(counter2+1)+Y2(counter2+2))+Y2(counter2+3));
            counter1=counter1+3; % next h 
            counter2=counter2+3; % next x point
            counter3=counter3+1; % next Integration value
        elseif h(counter1)==h(counter1+1)
            %simpson 1/3
            I(counter3)=(h(counter1)/3)*(Y2(counter2)+4*Y2(counter2+1)+Y2(counter2+2));
            counter2=counter2+2;
            counter1=counter1+2;
            counter3=counter3+1;
        else
            %trapezoidal
            I(counter3)=(Y2(counter2)+Y2(counter2+1))/(2)*h(counter1);
            counter1=counter1+1;
            counter2=counter2+1;
            counter3=counter3+1;
        end
            
    end
else % if only two hs exist (3 points)--special case
    for jj=1:length(x)-1
        if counter1==length(x)-1
             %trapezoidal
             I(counter3)=(Y2(counter2)+Y2(counter2+1))/(2)*h(counter1);
            counter1=counter1+1;
            break;
         end
         if counter1>length(x)-1
                break;
         end
    
        if h(counter1)==h(counter1+1)
            %simpson 1/3
            I(counter3)=(h(counter1)/3)*(Y2(counter2)+4*Y2(counter2+1)+Y2(counter2+2));
            counter2=counter2+2;
            counter1=counter1+2;
            counter3=counter3+1;
        else
            %trapezoidal
            I(counter3)=(Y2(counter2)+Y2(counter2+1))/(2)*h(counter1);
            counter1=counter1+1;
            counter2=counter2+1;
            counter3=counter3+1;
        end
    end
end
L2=sum(I);
end