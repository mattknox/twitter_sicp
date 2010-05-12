(include (file "/Users/mknox/h/twitter_sicp/1/mknox.scm"))
;; 8queens in scheme
;;

;; (define (nqueens n)
;;   (define (int safe rest)
;;     (if (null? rest)
;;         safe
;;         )))

(define (diag-safe? lst)
  (define (int top bottom l)
    (if (null? l)
        #t
        (and (not (= top (car l))   )
             (not (= bottom (car l)))
             (int (inc top) (dec bottom) (cdr l)))))
  (if (null? lst)
      #t
      (int (inc (car lst))
           (dec (car lst))
           lst)))
