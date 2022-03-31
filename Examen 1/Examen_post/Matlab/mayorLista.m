function mayor = mayorLista (lista)
    mayor = lista(1);
    for elem = lista
        if elem > mayor
            mayor = elem;
        end
    end
end

