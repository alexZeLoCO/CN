import Data.List

f3 x = x ^ x ^ x

fact x
  | x == 0 = 1
  | otherwise = x * fact (x -1)

superFactorial x
  | x == 0 = 1
  | otherwise = fact x * superFactorial (x -1)

listaSF n
  | n == 1 = [superFactorial n]
  | otherwise = superFactorial n : listaSF (n - 1)

main = do
  print (f3 5)
  print (fact 5)
  print (superFactorial 5)
  print (reverse (listaSF 10))