function out = quitaElems (lista, target)
    out = [];
    for elem = lista
        if elem ~= target
            out = [out, elem]; % No se puede prealocar espacio.
        end
    end
end
