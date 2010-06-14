(define (monte-carlo predicate lower-x upper-x lower-y upper-y))

(define (random-point lower-x upper-x lower-y upper-y)
  (let* ((x-range (- upper-x lower-x))
         (y-range (- upper-y lower-y))
         (x (+ lower-x (* x-range (random))))
         (y (+ lower-y (* y-range (random)))))
    (cons x y)))
