import Data.List

-- Retorna una lista de los resultados de 0 hasta n de una funcion f
formaLista f n
  | n == 1 = [f n]
  | otherwise = f n : formaLista f (n - 1)

-- Retorna el factorial de n
fact n
  | n == 0 = 1
  | otherwise = n * fact (n - 1)

-- Retorna el fibonnaci del numero n
fib n
  | n <= 2 = 1
  | otherwise = fib (n - 1) + fib (n - 2)

-- Retorna la funcion de la coyuntura de collatz
collatz :: Fractional a => a -> a
collatz n
  | mod n 2 == 0 = n / 2
  | otherwise = 3 * n - 2

-- Retorna el numero de cifras de un numero
cifras n
  | n < 1 = 0
  | otherwise = 1 + cifras (mod n 10)

-- Retorna  los numeros desde el uno hasta el n en formato 123456789101112
nums n
  | n == 1 = 1
  | otherwise = nums (n - 1) * (10 ^ cifras n) + n

-- Retorna el siguiente intervalo para hallar la raiz de una funcion segun el metodo de biseccion
bisec f lis
  | f ((head lis + head (tail lis)) / 2) * f (head lis) < 0 = [head lis, (head lis + head (tail lis)) / 2]
  | otherwise = [(head lis + head (tail lis)) / 2, head (tail lis)]

-- Itera el metodo de biseccion un dado numero de veces
veces f n lis
  | n == 1 = bisec f lis
  | otherwise = bisec f (veces f (n - 1) lis)

main = do
  print (fact 5)
  print (fib 5)
  print (formaLista fib 5)
  print (collatz 5) --FIXME: Int? Floating?
  print (formaLista collatz 5)
  print (nums 5)
  print (formaLista nums 5)
  print (bisec (\x -> x ^ 2 - 2) [0, 2])
  print (veces (\x -> x ^ 2 - 2) 10 [0, 2])
