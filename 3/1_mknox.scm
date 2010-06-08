(define (make-accumulator val)
  (lambda (x) (set! val (+ val x))
     val))
