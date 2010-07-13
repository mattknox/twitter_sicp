;; original list-of-values with indeterminate eval order
;; (define (list-of-values exps env)
;;   (if (no-operands? exps)
;;       '()
;;       (cons (eval (first-operand exps) env)
;;             (list-of-values (rest-operands exps) env))))

(define (list-of-values exps env)
  (if (no-operands? exps)
      '()
      (let ((x (eval (first-operand exps) env)))
        (cons x (list-of-values (rest-operands exps) env)))))
