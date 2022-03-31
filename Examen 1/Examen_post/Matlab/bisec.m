function a = bisec(a,b, iters, foo)
    for i = 0:iters
        display("A: foo(" + a + ") = " + foo(a))
        display("B: foo(" + b + ") = " + foo(b))
        if foo(a) * foo((a+b)/2) > 0 
            b = (a+b)/2;
        else
            a = (a+b)/2;
        end
    end
end