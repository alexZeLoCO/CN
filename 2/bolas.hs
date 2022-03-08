probabilidad blancas negras =
  blancas / (blancas + negras)

probabilidadAcumulada iter blancas negras
  | iter == 1 = probabilidad blancas negras
  | otherwise = probabilidadAcumulada (iter - 1) blancas negras * probabilidad blancas negras

main = do
  print (probabilidadAcumulada 2 1 99)
  print (probabilidadAcumulada 100 1 99)