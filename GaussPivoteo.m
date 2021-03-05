% Function that solves system of equations by the Gaussian method with pivoting
%Input
%A= Data matrix
%b= vector right part b '
%output
%x: Answers vector


function x=GaussPivoteo(A,b) 
[m,n]=size(A);
if m~=n , error ('The matrix must be square'); end
nb=n+1;
Aug=[A,b];

%Elimination

for k=1:n-1
    
    %Partial pivot
   [big,i]=max(abs(Aug(k:n,k)));
   ipr=i+k-1;
   if ipr~=k
       Aug([k,ipr],:)=Aug([ipr,k],:);
   end   
    
    for i= k+1:n 
        factor=Aug(i,k)/Aug(k,k);
        Aug(i,k:nb)=Aug(i,k:nb)-factor*Aug(k,k:nb);
    end
end
%Sustitution
x=zeros(n,1); 
x(n)=Aug(n,nb)/Aug(n,n);
for i=n-1:-1:1
    x(i)=(Aug(i,nb)-Aug(i,i+1:n)*x(i+1:n))/Aug(i,i);
end


end