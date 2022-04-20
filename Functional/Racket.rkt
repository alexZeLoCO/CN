#lang racket

; Actualización del valor según Regula Falsi.
; Recibe la funcion y los dos extremos actuales.
; Retorna el siguiente x a operar.
(define (nextFalsi f a b)
  (- b (* (f b) (/ (- b a) (- (f b) (f a)))))
)

; Actualización del valor según Bisección.
; Recibe una función (no utilizada para nada se recibe por compatibilidad) y los dos extremos actuales.
; Retorna el siguiente x a operar.
(define (nextBiseccion f a b)
  (/ (+ b a) '2)
  )

; Función ejemplo
(define (f x)
  (- (+ (expt x '5) (expt x '3) x) '3)
  )

; Método de búsqueda numérico.
; Recibe la funcion a evaluar, los dos extremos de un intervalo en el que se sepa hay una única raíz,
; el número de iteraciones a realizar y el método de actualización (nextBisección ó nextFalsi).
; Retorna los x correspondientes de las iteraciones en forma de lista: (x1 x2 x3 ... xn)
(define (findIter f a b iter next)
  (cond [(zero? iter) ]
        [(positive? (* (f a) (f (next f a b)))) (cons (cons (next f a b) (f (next f a b))) (findIter f (next f a b) b (- iter 1) next))]
        [else (cons (cons (next f a b) (f (next f a b))) (findIter f a (next f a b) (- iter 1) next))]
        )
  )

; Método de búsqueda numérico.
; Recibe la funcion a evaluar, los dos extremos de un intervalo en el que se sepa hay una única raíz,
; el error máximo a cometer y el método de actualización (nextBisección ó nextFalsi).
; Retorna los x correspondientes de las iteraciones en forma de lista: (x1 x2 x3 ... xn)
(define (findErr f a b err next)
  (cond [(< (calcError a b) err) ]
        [(positive? (* (f a) (f (next f a b)))) (cons (cons (next f a b) (f (next f a b))) (findErr f (next f a b) b err next))]
        [else (cons (cons (next f a b) (f (next f a b))) (findErr f a (next f a b) err next))]
        )
  )

; Calcula el error máximo.
; Recibe los extremos del intervalo que contiene la raíz.
; Retorna el error máximo, siendo x el punto medio.
(define (calcError a b)
  (/ (- b a) 2)
  )

(provide (all-defined-out))
