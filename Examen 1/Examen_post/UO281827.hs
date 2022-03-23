import Data.List

solver foo a b iter next
  | iter == 0 = next a b foo
  | foo a * foo (next a b foo) < 0 = solver foo a (next a b foo) (iter - 1) next
  | otherwise = solver foo (next a b foo) b (iter - 1) next

bisec a b foo = (b + a) / 2

calcIter a b err = logBase ((abs b - abs a) / 2) 2

main = do
  print (calcIter (negate 2) (negate 1) 1 / (10 ^ 2))

--print (solver (\x -> x ^ 3 - x ^ 2 - x + 7) (negate 2) (negate 1) (calcIter (negate 2) (negate 1) 1 / (10 ^ 2)) bisec)
--print ((\x -> x ^ 3 - x ^ 2 + x + 7) (solver (\x -> x ^ 3 - x ^ 2 - x + 7) (negate 2) (negate 1) (calcIter (negate 2) (negate 1) 1 / (10 ^ 2)) bisec))