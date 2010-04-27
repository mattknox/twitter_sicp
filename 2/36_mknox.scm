(define (foldr f v l)
  (if (null? l)
      v
      (f (car l) (foldr f v (cdr l)))))

(define (accumulate-n f v ll)
  (if (null? (car ll))
      nil
      (cons (foldr f v (map car ll))
            (accumulate-n f v (map cdr ll)))))
