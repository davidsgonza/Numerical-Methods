%Function that calculates the root by the Newton Raphson method
%Input:
%f: input function
%xl: minimum value
%tolerancia: required tolerance
%iter: maximum iterations
%Output
%raiz: root of the function


function raiz=newtonRaphson(f, x0, tolerancia, iter)
syms x;

cont=0; 
xA=x0;
Vreal=fzero(f,[0 1]); %Calculate the real root

    while(true) %Performs Newton Raphson method
        
        D=diff(f,x);                            %Calculation of xr
        xr=xA-(f(xA)/eval(subs(D,[x],[xA])));        
        Et=abs(((Vreal-xA)/Vreal))*100;      % Error calculation   
        Ea=abs((xr-xA)/xr)*100;  %Error calculation
        %T(cont+1,:)=[cont xA  Et Ea ] ;                    %Create data table       
        CONT(cont+1)=cont; XR(cont+1)=xA; ET(cont+1)=Et; EA(cont+1)=Ea;
        xA=xr;
        if Ea<tolerancia || cont>=iter %Condition to finish
            break;            
        end  
     cont=cont+1;
    end
    T1 = table( CONT', XR',ET',EA',  'VariableNames',{'iter','xr','Et','Ea'})  
   %fprintf(' i        xr       Et     Ea   \n' )
   %fprintf('%2.0f  %10.5f %10.5f  %10.5f  %10.5f \n',T')
   
    raiz=xr;
 
end

