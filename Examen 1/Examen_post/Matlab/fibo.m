function out = fibo (n)
    if n<=1
		out=1;
	else
		out=fibo(n-2)+fibo(n-1);
    end
end