function [b_current, b_old] = dekkers_mod(f,a,b,e,ef)
    %a modified version of Dekker's method, instead of using the secant
    %method only when f(b_current) != f(b_old), we also use the secant
    %method if f(b_current) and f(b_old) differ by some small value ef
    
    %assert( b < a )
    
    %f = @(x)1+x.*exp(x)-5.*x.^2;
    
    assert( sign(f(a)) ~= sign(f(b)) )
    
    b_current = b;
    a_current = a;
    
 
    if(abs(f(a_current)) < (abs(f(b_current))))
            temp = a_current;
            a_current = b_current;
            b_current = temp;
    end
    
    b_old = a_current;
    
    while(abs(b_current - a_current) > e)
        %if the functional values of our last two estimates differ more than
        %ef, our new provisional estimate will be calculated using one
        %iteration of the secant method
        m = (a_current + b_current)/2;
        
        if(abs(f(b_current)-f(b_old)) > ef)
            s = secant(f,b_old,b_current,0,1);
        %otherwise, our provisional estimate is found using the bisection
        %method
        else
            m = (a_current + b_current)/2;
            s = m;
        end
        %our new b_current now equals s if s lies between b_current and m, and
        %m otherwise, so that we chose the smallest possible bracket of 
        %estimation

        %because of this step, if f(b_current)-f(b_old) is small it is likely
        %that m is used as a value, as the secant line of these points will 
        %be very flat making |s| large, which is the reason that this
        %algorithm works without the ef modification
        b_old = b_current;
        if(s > b_current && s < m)
            b_current = s;
        else 
            b_current = m;
        end 

        %find new a_current if neccesary, so that a and b have different signs
        if(sign(f(b_current)) == sign(f(a_current)))
            a_current = b_old;   
        end
        
        %if |f(a)| < |f(b)|, a is a better estimate so we should swap a and b
        if(abs(f(a_current)) < (abs(f(b_current))))
            temp = a_current;
            a_current = b_current;
            b_current = temp;
        end   
    end
    disp(b_old)
end

