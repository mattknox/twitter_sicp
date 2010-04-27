(include (file "/Users/mknox/h/twitter_sicp/1/mknox.scm")) ; for foldr

(define accumulate foldr)

(define (sum s)
  (foldr + 0 s))

(define (sum-* x y)
  (sum (map * x y)))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (x) (dot-product x v)) m))

(define (transpose mat)
  (accumulate-n cons nil mat))

; returns p s.t. p ij = sum(k) m ik * n kj
; p ij = sum(k) m ik * (transpose n) jk
(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (x) (matrix-*-vector cols x)) m)))

(define m '((1 2 3 4) (4 5 6 6) (6 7 8 9)))
(define v '(1 2 3 4))
(define (mv m v) (map (lambda (x) (dot-product x v)) m))
(define m*m matrix-*-matrix)
