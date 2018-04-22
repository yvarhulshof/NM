function [ c ] = bisection_root( f,a,b, e )
%Compute a root of the equation f(x)=0 in [a,b] to accuracy e using the 
%bisection method.
    assert( a < b )
    assert( sign(f(a)) ~= sign(f(b)) )
    i = 0;
    
    while (b-a)/2 > e
        i=i+1;
        c=(a+b)/2;

        %Display a,c,b, f(c) and (b-a)/2
        [a,c,b,f(c),(b-a)/2]

        if sign(f(c)) == sign(f(a))
            a=c;
        else
            b=c;
        end
        
    end
    disp(i)
    
end

