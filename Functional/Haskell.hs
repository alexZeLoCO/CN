-- Comment
{-
 - Multi-line Comment
 -}

import Data.Bool
import Data.List
import GHC.Base (VecElem (Int16ElemRep))
import System.IO
import System.Win32 (COORD (y))
import qualified System.Win32 as Rhapson

{-
 - Retorna el siguiente elemento a evaluar según el método de Biseccion
 -}
nextBiseccion f a b =
  (b + a) / 2

{-
 - Retorna el siguiente elemento a evaluar según Regula Falsi
 -}
nextFalsi f a b =
  b - f b * ((b - a) / (f b - f a))

{-
 - Dado un número de iteraciones, retorna la raíz.
 -}
findIter f a b iter next
  | iter <= 1 = next f a b
  | f a * f (next f a b) > 0 = findIter f (next f a b) b (iter - 1) next
  | otherwise = findIter f a (next f a b) (iter - 1) next

{-
-- Funcion en desuso, ver findErr f a b err
findErr f a b err = findError f a b err 0

-- Funcion en desuso, ver findErr f a b err
findError f a b err iter next
  | calcErr a b iter < err = f (next f a b)
  | f a * f (next f a b) > 0 = findError f (next f a b) b err (iter + 1) next
  | otherwise = findError f a (next f a b) err (iter + 1) next
-}

{-
 - Halla la raíz de la ecuación que alcanza un error máximo dado.
 - Utiliza calcIter para calcular el número de iteraciones necesarias para
 - calcular en función del error.
 - Utiliza el número de iteraciones para llamar a findIter y retorna su resultado.
 -}
findErr f a b err = findIter f a b (calcIter a b err)

{-
-- Función en desuso, ver findDef f a b
findDefinite f a b next
  | f (next f a b) == 0 = next f a b
  | f a * f (next f a b) > 0 = findDefinite f (next f a b) b next
  | otherwise = findDefinite f a (next f a b) next
 -}

{-
 - Halla la raíz de la ecuación con error 0.
 - Llama a findErr con parametro err = 0
 -}
findDef f a b next = findErr f a b 0

{-
 - Calcula el error cometido
 -}
calcErr a b n =
  (b - a) / (2 ^ n)

{-
 - Función ejemplo
 -}
f x = x ^ 5 + x ^ 3 + x - 3

{-
 - Calcula el número de iteraciones necesarias para alcanzar un error máximo dado
 -}
calcIter a b err =
  logBase 2 ((b - a) / err)

{-
 - Calcula la derivada aproximada dada su función primitiva, un punto x y un valor (h).
 - A menor sea h, mejor será la aproximación.
 - Retorna la derivada aproximada.
 -}
derivApprox f x h =
  (f (x + h) - f x) / h

{-
 - Calcula una raíz aproximada dada una función, una raíz y un número de iteraciones a realizar.
 - Utiliza aproximaciones para calcular las derivadas.
 - Método Newton-Rhapson.
 - Retorna raíz aproximada de la función.
 -}
findNewton f r iter
  | iter == 1 = r - f r / derivApprox f r 1
  | otherwise = findNewton f (r - (f r / derivApprox f r 1)) (iter - 1)

{-
 - Calcula una iteracion del metodo de punto fijo.
 - Retorna el x-enésimo del punto fijo.
 -}
fixed f x iter
  | not (localConvergenceRoot f x) = error "No convergencia"
  | iter == 1 = f x
  | otherwise = fixed f (f x) (iter - 1)

{-
 - Revisa la convergencia local de una función en un punto.
 - Retorna true si converge y false si no.
 -}
localConvergenceRoot f root =
  abs (derivApprox f root (5 / (10 ^ 2))) < 1

--TODO: TEST
{-
 - Revisa la convergencia local de una función en un intervalo.
 - Retorna true si converge para todos los valores del intervalo y false si no.
 -}
localConvergenceInterval f a b =
  (a < derivApprox f a (5 / (10 ^ 2)))
    && (derivApprox f a (5 / (10 ^ 2)) < b)
    && (a < derivApprox f b (5 / (10 ^ 2)))
    && (derivApprox f b (5 / (10 ^ 2)) < b)

main = do
  -- print (findErr f 0 3 (5 / (10 ^ 2)) nextBiseccion)
  -- print (findNewton (\x -> x ^ 3 + 4 * x ^ 2 - 10) 1.5 5)
  print (fixed (\x -> negate (0.25 * x ^ 2) + x + 1) (negate 2) 3)

-- print (localConvergence (\x -> negate (0.25 * x ^ 2) + x + 1) 1.999)