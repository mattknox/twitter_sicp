(define (monte-carlo pred trials lower-x upper-x lower-y upper-y)
  (let ((hits 0))
    (times trials (lambda () (if (intersect pred lower-x upper-x lower-y upper-y)
                            (set! hits (+ hits 1)))))
    (* (- upper-x lower-x) (- upper-y lower-y) (/ trials hits))))

(define (intersect pred lower-x upper-x lower-y upper-y)
  (apply pred (random-point lower-x upper-x lower-y upper-y)))

(define (times n f) ; run a function f for effect n times
  (if (< n 1)
      f
      (begin (f)
             (times (dec n) f))))

(define (random-point lower-x upper-x lower-y upper-y)
  (let* ((x-range (- upper-x lower-x))
         (y-range (- upper-y lower-y))
         (x (+ lower-x (* x-range (random))))
         (y (+ lower-y (* y-range (random)))))
    (list x y)))
