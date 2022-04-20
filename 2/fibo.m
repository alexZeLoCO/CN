function fib = fibo (n)
    if (n<3)
        fib = 1;
    else
        fib = fibo (n-1) + fibo (n-2);
    end
end