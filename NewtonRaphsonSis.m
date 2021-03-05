%Function that calculates the simultaneous root by Newton Raphson's method
%Input:
%fu:input u function
%fv: input v function
%xi:initial x value
%yi: initial y value
%iter: maximum iterations
%Output
%[x y]:system solution

function [x,y]=NewtonRaphsonSis(fu,fv,xi,yi,iter)
syms x y;
cont=0;  
                  
 dux=eval(subs(diff(fu,x),[x,y],[xi,yi])); %Calculate and evaluate the different partial derivatives
 duy=eval(subs(diff(fu,y),[x,y],[xi,yi]));
 dvx=eval(subs(diff(fv,x),[x,y],[xi,yi]));
 dvy=eval(subs(diff(fv,y),[x,y],[xi,yi]));
 jac=dux*dvy-duy*dvx;
 
    while (true) %Perform Newton Raphson's algorithm
        
      u0=fu(xi,yi);
      v0=fv(xi,yi) ;
      xi=xi-((u0*dvy-v0*duy)/jac); 
      yi=yi-((v0*dux-u0*dvx)/jac);
                 
        if  cont>=iter %Condition to finish
            x=xi;
            y=yi;
            break;            
        end  
     cont=cont+1;
    end
end