function Y2= Differentiation (Data)
x=Data(:,1);
y=Data(:,2);
%----Differentiation Part
for i=1:length(x)
    % Initial point---% Forward Difference
    if i==1
        if length(x)==2 % special case for one h or two points only
            Ybar(i)=(y(i+1)-y(i))/(x(i+1)-x(i)); % O(h)
        elseif abs(x(i+1)-x(i))~=abs(x(i+2)-x(i+1)) % check h 
            Ybar(i)=(y(i+1)-y(i))/(x(i+1)-x(i)); % O(h)
        else
            Ybar(i)=(-y(i+2)+4*y(i+1)-3*y(i))/(2*(x(i+1)-x(i))); % O(h^2)
        end
    % end Point--% Backward Difference
    elseif i==length(x)
        if length(x)==2 % special case for single h
            Ybar(i)=(y(i)-y(i-1))/(x(i)-x(i-1)); % O(h)
        elseif abs(x(i)-x(i-1))~=abs(x(i-1)-x(i-2)) % check h
            Ybar(i)=(y(i)-y(i-1))/(x(i)-x(i-1)); % O(h)
        else
            Ybar(i)=(3*y(i)-4*y(i-1)+y(i-2))/(2*(x(i)-x(i-1))); % O(h^2)
        end
    % interior points
    else
        if abs(x(i+1)-x(i))~=abs(x(i)-x(i-1)) % check h
            % Forward Difference
            Ybar(i)=(y(i+1)-y(i))/(x(i+1)-x(i)); % O(h)
        else
            % Centered Difference
            Ybar(i)=(y(i+1)-y(i-1))/(2*(x(i+1)-x(i))); % O(h^2)
        end
    end
end
%---Sqrt (1+ybar^2)
for j=1:length(x)
    Y2(j)=sqrt(1+Ybar(j)^2); % Y2 array from differentiation to be integrated to calculate the length
end
end
