%Lagrange polynomials

function [C]=pol_lagrange(x,y)
n1=length(x);
n=n1-1;
L=zeros(n1,n1);

for k=1:n+1
    v=1;
    for j=1:n+1
        if k~=j 
            v=conv(v,poly(x(j)))/(x(k)-x(j));
        end
    end
    L(k,:)=v;
    
C=y*L;
end