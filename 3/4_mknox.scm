; need to make this get pissed when a bad password is given a total of
; N times in a row.
(define (make-account balance password allowed-attempts)
  (define (withdraw amount provided-password)
    (cond ((not (equal? password provided-password)) "bad password")
          ((< balance amount) "insufficient balance")
          (else (begin (set! balance (- balance amount))
                       balance))))
  withdraw)
