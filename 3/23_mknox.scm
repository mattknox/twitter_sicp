(define (empty-dequeue)
  (cons '() '()))

(define (front dequeue)
  (caar dequeue))

(define (rear dequeue)
  (cdar dequeue))

(define (front-insert! dequeue elt)
  (set-car! dequeue (cons elt (car dequeue))))

(define (front-delete! dequeue)
  (set-car! dequeue (cadr dequeue)))
