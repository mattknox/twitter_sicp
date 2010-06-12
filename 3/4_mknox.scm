; need to make this get pissed when a bad password is given a total of
; N times in a row.
(define (make-account balance password allowed-attempts)
  (define remaining-attempts allowed-attempts)
  (define (handle-password provided-password)
    (if (equal? password provided-password)
        (and (set! remaining-attempts allowed-attempts) #f)
        (begin (set! remaining-attempts (- remaining-attempts 1))
               (if (= 0 remaining-attempts)
                   (call-cops)
                   "bad password"))))

  (define (call-cops)
    (print "calling cops")
    #t)

  (define (withdraw amount provided-password)
    (cond ((handle-password provided-password)  "password issues")
          ((< balance amount) "insufficient balance")
          (else (begin (set! balance (- balance amount))
                       balance))))
  withdraw)
