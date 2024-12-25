clc
clear
close all
%----create txt file on your matlab destination in your pc
%----then enter the data points
fprintf ('Enter (1) if you have txt file or (2) for input data matrix');
i=input('input number: ');
if i==1
    load ('Data.txt');
else
    Data=input('Data matrix: ');
end
%----Analytical Part
[A,C]=Splines(Data);
X = gausselim(A,C);
Length=Calculate(X,Data);
Length

%----Numerical Part
Y2= Differentiation (Data);
L2= Integration (Data,Y2);
L2

