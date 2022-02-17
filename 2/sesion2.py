import sys

# Retorna el factorial de n


def fact(n):
    if (n == 0):
        return 1
    else:
        return n * fact(n-1)

# Retorna la sucesión de fibonacci de longitud n


def fib(n):
    if (n <= 2):
        return 1
    else:
        return fib(n - 1) + fib(n - 2)

# Retorna la lista de las sucesiones de fibonnaci desde 1 hasta n


def listFib(n):
    out = []
    for i in range(n):
        out.append(fib(i + 1))
    return out

# Retorna función de la coyuntura de collatz


def collatz(n):
    if (n % 2 == 0):
        return n / 2
    else:
        return 3 * n + 1

# Retorna una lista con las coyunturas de collatz desde 0 hasta n


def listColl(n):
    out = []
    for i in range(n + 1):
        out.append(collatz(i))
    return out

# Retorna el numero de cifras en un dado numero


def cifras(n):
    c = 0
    while (n > 0):
        n = n // 10
        c += 1
    return c

# Retorna los numeros desde el 1 hasta n en formato: 123456789101112


def nums(n):
    if (n == 1):
        return 1
    else:
        return nums(n - 1) * (10 ** (cifras(n))) + n

# Retorna una lista con los numeros mostrados con el formato anterior desde el 1 hasta el n


def listNums(n):
    out = []
    for i in range(n):
        out.append(nums(i + 1))
    return out

# Funcion


def f(x):
    return x**2 - 2

# Siguiente intervalo para hallar la raiz de una funcion segun el metodo de biseccion


def bisec(lis):
    if f((lis[0] + lis[1]) / 2) * f(lis[0]) < 0:
        return [lis[0], (lis[1] + lis[0]) / 2]
    else:
        return [(lis[1] + lis[0]) / 2, lis[1]]

# Itera el metodo de biseccion un dado numero de veces


def veces(n):
    if (n == 1):
        return bisec([0, 2])
    else:
        return bisec(veces(n - 1))

# MAIN


def main(argv):
    print(argv + "! = " + str(fact(int(argv))))
    print("fib (" + argv + ") = " + str(fib(int(argv))))
    print("listFib (" + argv + ") = " + str(listFib(int(argv))))
    print("collatz (" + argv + ") = " + str(collatz(int(argv))))
    print("listColl (" + argv + ") = " + str(listColl(int(argv))))
    print("nums (" + argv + ") = " + str(nums(int(argv))))
    print("listNums (" + argv + ") = " + str(listNums(int(argv))))
    print("bisec([0, 2]) = " + str(bisec([0, 2])))
    print("veces (10) = " + str(veces(10)))


if __name__ == '__main__':
    if (len(sys.argv) == 2):
        main(sys.argv[1])
    else:
        print("ERROR: Se debe introducir:\n\tsesion1.py <numero>")
