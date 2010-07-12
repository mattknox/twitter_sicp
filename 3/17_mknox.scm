(define (count-cons l . seen)
  (if (or (not (pair? l))
          (member? l seen))
      0
      (+ 1
         (apply count-cons (car l) (cons l seen))
         (apply count-cons (cdr l) (cons l seen)))))

(define (member? elt l)
  (cond ((null? l) #f)
        ((eq? elt (car l)) #t)
        (#t (member? elt (cdr l)))))

(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ 1 ; for the pair in question
         (count-pairs (car x))
         (count-pairs (cdr x)))))
