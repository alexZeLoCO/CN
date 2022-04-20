import math


def sumar_lista(lista):
    suma = 0
    for i in lista:
        suma += i
    return suma


def max_lista(lista):
    _max = lista[0]
    for i in lista:
        if i > _max:
            _max = i
    return _max


def min_lista(lista):
    _min = lista[0]
    for i in lista:
        if i < _min:
            _min = i
    return _min


def quita_n(lista, n):
    output = []
    for i in lista:
        if i != n:
            output.append(i)
    return output


def tribo(n):
    if n > 2:
        return tribo(n-1) + tribo(n-2) + tribo(n-3)
    else:
        return 1


def vuelta(lista):
    output = []
    for i in range(len(lista)-1, -1, -1):
        if lista[i] is list:
            output.append(vuelta(lista[i]))
        else:
            output.append(lista[i])
    return output


def main():
    print(sumar_lista([1, 2, 3, 4]))
    print(max_lista([1, 2, 3, 4]))
    print(min_lista([1, 2, 3, 4]))
    print(quita_n([1, 2, 5, 1, 1, 7], 1))
    print(tribo(10))
    # print(tribo(10**6)/tribo(10**6-1))     # RecursionError: maximum recursion depth exceeded in comparison
    print(vuelta([1, [1, 2], [1, [3, 4, [5, 6]]], 5]))


if __name__ == '__main__':
    main()
