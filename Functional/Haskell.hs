-- Comment
{-
 - Multi-line Comment
 -}

import Data.List
import GHC.Base (VecElem (Int16ElemRep))
import System.IO
import System.Win32 (COORD (y))

nextBiseccion f a b =
  (b + a) / 2

nextFalsi f a b =
  b - f b * ((b - a) / (f b - f a))

findIter f a b iter next
  | iter == 1 = f (next f a b)
  | f a * f (next f a b) > 0 = findIter f (next f a b) b (iter - 1) next
  | otherwise = findIter f a (next f a b) (iter - 1) next

f x = x ^ 5 + x ^ 3 + x - 3

main = do
  print (findIter (\x -> x ^ 3 + x * 5) (negate 1) 1 3 nextFalsi)
