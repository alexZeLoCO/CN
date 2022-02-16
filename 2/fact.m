function pepe = fact (n)
    if (n == 0)
        pepe=1;
    else 
        pepe = n * fact (n-1);
    end  
end