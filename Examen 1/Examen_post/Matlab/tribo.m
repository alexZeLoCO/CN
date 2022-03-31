%tribo(10^6)/tribo(10^6-1) ==> Out of memory.
%tribo(10^6)               ==> Out of memory.       
function out = tribo (n)
    if n <= 2
        out = 1;
    else
        out = tribo(n-1) + tribo(n-2) + tribo(n-3);
    end
end
    