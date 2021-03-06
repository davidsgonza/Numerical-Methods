% Function that calculates the root by means of the modified secant method
%Input:
%f: function
%x0: 
%Delta: delta requested
%tolerancia:the accepted tolerance value
%iter: maximum iterations
%a: actual value range
%Output: 
%raiz: calculated root

function raiz=secanteModificado(f, x0, Delta, tolerancia, iter)
syms x;

cont=0; 
Vreal=fzero(f,[0 1.5]);

    while(true)              
        
       xi=x0-((Delta*f(x0))/(f(x0+Delta)-f(x0))); 
       Ea=abs((xi-x0)/xi)*100;
       x0=xi;  
       Et=abs(((Vreal-xi)/Vreal))*100;  %Error    
       
       
       
    % T(cont+1,:)=[cont+1 xi   Et  Ea ] ;                    %Create data table       
    CONT(cont+1)=cont+1; XI(cont+1)=xi;  ET(cont+1)=Et; EA(cont+1)=Ea; 
    
    
        if Et<tolerancia || cont>=iter %Condition to finish
         break;            
        end  
    cont=cont+1;
    end
  T1 = table( CONT', XI',ET', EA', 'VariableNames',{'iter','xi','Et','Ea'})
   %fprintf(' i        xi         Et        Ea    \n' )
   %fprintf('%2.0f  %10.5f %10.5f %10.5f  \n',T')
    raiz=xi;
end