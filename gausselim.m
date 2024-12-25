function x = gauss_elim(A,b)
n = length(b);  %obtain the number of rows 
r = height(A);  %obtain the number of rows (length and height are interchangable)
c = width(A);   %obtain the number of columns 
if r ~= c       %condition that the coefficient matrix is a square matrix
    errordlg('Coefficient matrix is not a square matrix.')
    return
else            %if the matrix is square
    if det(A) == 0      %calculates determinant and report if singular
        disp('The coefficient matrix is singluar!')
    else 
        disp('The coefficient matrix is not singluar.')
    end
    for k = 1:n-1       %loop over the number of rows
        for p = k+1:n   % for loop to perform partial pivoting over all rows
            if (abs(A(k,k)) < abs(A(p,k)))      %checks the kkth elment to be less than the pkth
                A([k p],:) = A([p k],:);        %replace the rows of the coefficient matrix
                b([k p]) = b([p k]);            %replace the rows of the constant mtrix
            end
        end
        for i=k+1:n                     %loop over all rows
            factor = A(i,k)/A(k,k);     %calculate the factor, i.e. R -> factor * R ± R
            A(i,k+1:n)=A(i,k+1:n)-factor*A(k,k+1:n);       %replace that element with the newly factored element. 
            b(i)=b(i)-factor*b(k);                         %same with the constant matrix
        end
    end
    x(n)=b(n)/A(n,n);           %compute the x matrix and storing the last element, last element in b divided by a_r*c
    for i=n-1:-1:1              
        sum = b(i);             %compute the sum of all elements in b
        for j =i+1:n
            sum = sum-A(i,j)*x(j);    %compute the sum for the other iterations on all other x matrix values
        end
        x(i)=sum/A(i,i);        %stoore the elements in the x matrix by dividing the current sum with the current index element in A.
    end
end