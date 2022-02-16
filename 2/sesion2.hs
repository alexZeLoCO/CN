import Data.List

formaLista f n
  | n == 1 = [f n]
  | otherwise = f n : formaLista f (n - 1)

fact n
  | n == 0 = 1
  | otherwise = n * fact (n - 1)

fib n
  | n <= 2 = 1
  | otherwise = fib (n - 1) + fib (n - 2)

collatz n
  | even n = n / 2
  | otherwise = 3 * n - 2

cifras n
  | n < 1 = 0
  | otherwise = 1 + cifras (mod n 10)

nums n
  | n == 1 = 1
  | otherwise = nums (n - 1) * (10 ^ cifras n) + n

bisec f lis
  -- FIXME:
  | (f (head lis + head (tail lis)) / 2) * f (head lis) < 0 = [head lis, (head lis + head (tail lis)) / 2]
  | otherwise = [(head lis + head (tail lis)) / 2, head (tail lis)]

main = do
  print (bisec (\x -> x ^ 2 -2) [0, 2])