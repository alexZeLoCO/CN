import Data.List
import System.Win32 (COORD (x))

solver foo a b iter next
  | iter == 0 = next a b foo
  | foo a * foo (next a b foo) < 0 = solver foo a (next a b foo) (iter - 1) next
  | otherwise = solver foo (next a b foo) b (iter - 1) next

bisec a b foo = (b + a) / 2

calcIter a b err = logBase ((abs b - abs a) / 2) 2

tribo n
  | n < 3 = 1
  | otherwise = tribo (n -1) + tribo (n -2) + tribo (n -3)

foo x = x ^ 3 - x ^ 2 + x -7

main = do
  --  print (tribo (10 ^ 6) / tribo (10 ^ 6 -1))
  --  print (calcIter (negate 2) (negate 1) 1 / (10 ^ 2))
  --print (solver (\x -> x ^ 3 - x ^ 2 - x + 7) (negate 2) (negate 1) (calcIter (negate 2) (negate 1) 1 / 10) bisec)
  --print ((\x -> x ^ 3 - x ^ 2 + x + 7) (solver (\x -> x ^ 3 - x ^ 2 - x + 7) (negate 2) (negate 1) (calcIter (negate 2) (negate 1) 1 / 10) bisec))
  print (solver foo 2 3 1000 bisec)
  print (foo (solver foo 2 3 1000 bisec))