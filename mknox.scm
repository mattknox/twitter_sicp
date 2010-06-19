; I fairly frequently implement the same method more than once.
; Accordingly, I'd like do define a bunch of tests of the form:
; (test-equality '(foo bar baz) '(1 2 3 4 5))
; and make sure that all three functions return the same
; results for those arguments.

(define (test-results fs args)
  (if (null? (cdr fs))
      #t
      (and (test-results (cdr fs) args)
           (map (lambda (x y) (= x y))
                (map (lambda (al) (apply (car fs) al)) args)
                (map (lambda (al) (apply (cadr fs) al)) args)))))

(define (return-same-result f g arglist)
  (let ((f-results (apply f arglist))
        (g-results (apply g arglist)))
    ; should make this print.
    (= f-results g-results)))

(define (same-results f g arglists)
  '())

; I want to build up a test framework in scheme, using macros, so...
(require mzlib/defmacro)

(define (apply-n-times n f s)
  (if (<= n 0)
      s
      (apply-n-times (- n 1) f (f s))))

(define (foldr f v l)
  (if (null? l)
      v
      (f (car l) (foldr f v (cdr l)))))

(define (foldl f v l)
  (if (null? l)
      v
      (foldl f (f v (car l)) (cdr l))))

(define (compose f g)
  ; it's somewhat annoying that I can't make this arbitrary-arity.
  ; but scheme doesn't seem to have a way to do that.
  (lambda (arg . args)
    (f (apply g (cons arg args)))))

(define (compose-1arg f g) (lambda (x) (f (g x))))

(define (inc x) (+ 1 x))
(define (dec x) (- x 1))
(define (ident x) x)

(define (.. x y)
  (if (> x y)
      '()
      (cons x (.. (inc x) y))))

(define (take n l)
  ; take at most n elements of list l
  (if (or (null? l) (= 0 n))
      '()
      (cons (car l)
            (take (- n 1) (cdr l)))))

(define (filter f l)
  (cond ((null? l) '())
        ((f (car l)) (cons (car l) (filter f (cdr l))))
        (#t (filter f (cdr l)))))

(define (remove elt l)
  (cond ((null? l) l)
        ((= elt (car l)) (remove elt (cdr l)))
        (#t (cons (car l) (remove elt (cdr l))))))


(define (nth n l)
  (if (= 0 n)
      (car l)
      (nth (- n 1) (cdr l))))

(define (rcd l)
    (if (or (null? l) (null? (cdr l)))
        '()
        (cons (car l) (rcd (cdr l)))))

; largely useless object-style iterator.
(define (iterator a b nullv)
  (define (next!)
    (if (not (> a b))
        (begin
          (set! a (+ a 1))
          (- a 1))
        nullv))
  (lambda (msg)
    (cond ((eq? msg 'done?) (> a b))
          ((eq? msg 'next) (next!))
          (#t (error "can't understand this message")))))

(define (run-length-encode elts)
  (define (int current count l)
    (cond ((null? l) (list (list count current)))
          ((= current (car l)) (int current (inc count) (cdr l)))
          (#t (cons (list count current) (int (car l) 1 (cdr l))))))
  (if (null? elts)
      '()
      (int (car elts) 1 (cdr elts))))

(define (scale-list n l)
  (if (null? l)
      '()
      (cons (+ n (car l))
            (scale-list (inc n) (cdr l)))))

(define (find-first f l) ; return the first elt with true (f elt), or #f
  (cond ((null? l) #f)
        ((f (car l)) (car l))
        (#t (find-first f (cdr l)))))

(define (find-first-result f l) ; return the first truthy (f elt), or #f
  (cond ((null? l) #f)
        ((f (car l))) ; wacky idiom.  This returns (f (car l)) if true
        (#t (find-first-result f (cdr l)))))

(define (member? elt l)
  (cond ((null? l) #t)
        ((eq? elt (car l)) #t)
        (#t (member? elt (cdr l)))))

(define (any? f l)
  (cond ((null? l) #f)
        ((f (car l)) #t)
        (else (any? f (cdr l)))))

(defmacro defop= (op)
  (let ((name (string->symbol (string-append (symbol->string op) "="))))
    (defmacro (var val) `(begin (set! ,var (,op ,var ,val)) ,var))))

(defmacro -= (var val) `(begin (set! ,var (- ,var ,val)) ,var))
(defmacro += (var val) `(begin (set! ,var (+ ,var ,val)) ,var))
