function menor = menorLista (lista)
    menor = lista(1);
    for elem = lista
        if elem < menor
            menor = elem;
        end
    end
end
