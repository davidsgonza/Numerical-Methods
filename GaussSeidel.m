% Function that solves a system of equations by the Gauss-Seidel method
%Input:
%A=Parameter matrix
%b= right vector
%es= error stop
%maxit= maximum interactions
%output
%x= answer vector


function x=GaussSeidel(A,b, es, maxit)

    if nargin<2,error('Se necesitan almenos dos parametros'),end
    if nargin<3||isempty(maxit), maxit=50;end
    if nargin<3||isempty (es), es=0.00001; end
    [m,n]=size(A); 
    if m~=n, error('Matriz A tiene que ser cuadrada'); end
    C=A;

    for i=1:n
        C(i,i)=0;
        x(i)=0;
    end
    x=x'; 
    for i=1:n
        C(i,1:n)=C(i,1:n)/A(i,i); 
    end

    for i=1:n
        d(i)=b(i)/A(i,i);
    end
    iter=0;

    while(1)
    xold=x;
        for i=1:n
            x(i)=d(i)-C(i,:)*x;
            if x(i)~=0
                ea(i)=abs((x(i)-xold(i))/x(i))*100;
            end
            
        end
        iter=iter+1;
        if max(ea)<=es || iter >= maxit
            break;
        end     
    end
    

end