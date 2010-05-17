(include (file "/Users/mknox/h/twitter_sicp/1/mknox.scm"))
;; 8queens in scheme
;;

; the approach here should be to start with the empty list of safe
; queens, and (0 1 2 ... 7) the columns in which to put them.  Grab
; one, see if it conflicts with what's already there, if so, fail and
; backtrack.  If it is safe, try to place the next queen with the
; placed queen removed from the list.

(define (nqueens n)
  (define (int safe rest)
    (print safe)
    (newline)
    (print rest)
    (newline)
    (if (null? rest)
        safe
        (let ((candidates (filter (lambda (x) (diag-safe? (cons x safe))) rest)))
          (print candidates)
          (newline)
          (newline)
          (find-first (lambda (val) (int (cons val safe)
                                    (remove val rest))) candidates))))
  (int '() (.. 0 (dec n))))

(define (diag-safe? lst)
  (define (int top bottom l)
    (if (null? l)
        #t
        (and (not (= top (car l)))
             (not (= bottom (car l)))
             (int (inc top) (dec bottom) (cdr l)))))
  (if (null? lst)
      #t
      (int (inc (car lst))
           (dec (car lst))
           (cdr lst))))
