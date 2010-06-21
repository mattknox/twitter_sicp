(define (cycle? list)
  (define (stepper p1 p2)
    (cond ((or (null? p2) (null? (cdr p2))) #f)
          ((eq? p1 p2) #t)
          (#t (stepper (cdr p1) (cdr (cdr p2))))))
  (cycle? list (cdr list)))