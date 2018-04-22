function [ roots ] = dekkers_mod_multipleRoots( f,a,b, nrOfRoots)
    %creating a random number start and end interval
    %inside the given bracket
    
    %while length(roots) < nrOfRoots
    
    %roots = zeros(nrOfRoots);
    
    eps = 0.1;
    
    roots = [];
    
    %for i=0:nrOfRoots
    while length(roots) < nrOfRoots
        X1 = rand * abs(b-a) + a;
        X2 = rand * abs(b-a) + a;
        
        if(sign(f(X1)) ~= sign(f(X2))) 
            possibleRoot = dekkers_mod(f,X1,X2,10^-6,0.1);    
            if(isempty(roots))
                roots(1) = possibleRoot;
            else
                alreadyFound = false;
                for j=1:length(roots)
                    if(abs(possibleRoot - roots(j)) < eps)
                        alreadyFound = true;
                    end
                end
                if(~alreadyFound) 
                   roots = [roots, possibleRoot];
                end
            end
        end
     end
end

