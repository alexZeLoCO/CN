import System.Win32 (COORD (x))

au = (1 + 5 ** (1 / 2)) / 2

delta a b = (au - 1) * (b - a)

alpha a b = b - delta a b

beta a b = a + delta a b

min a b foo iters
  | iters == 0 = (b + a) / 2
  | foo (alpha a b) < foo (beta a b) = Main.min a (beta a b) foo (iters - 1)
  | otherwise = Main.min (alpha a b) b foo (iters - 1)

max a b foo iters
  | iters == 0 = (b + a) / 2
  | foo (alpha a b) > foo (beta a b) = Main.max a (beta a b) foo (iters - 1)
  | otherwise = Main.max (alpha a b) b foo (iters - 1)

square lis
  | null lis = lis
  | otherwise = head lis ** 2 : square (tail lis)

test f x
  | null x = x
  | otherwise = head f (head x) : test (tail f) (tail x)

main = do
  print (Main.min 6 8 (\x -> cos (pi * (-6 + x)) / x) 2)
  print (Main.min 0 1 (\x -> (2 + 3 * (-8 * x) -5 * (10 * x)) ** 2 + (2 -8 * x -3 * (10 * x) * (-8 * x)) ** 2) 1)
  print (test [(+ 1), (+ 2), (+ 3)] [3, 2, 1])