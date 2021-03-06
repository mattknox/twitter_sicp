;; original list-of-values with indeterminate eval order
;; (define (list-of-values exps env)
;;   (if (no-operands? exps)
;;       '()
;;       (cons (eval (first-operand exps) env)
;;             (list-of-values (rest-operands exps) env))))

;; evals left-to-right
(define (list-of-values-l-r exps env)
  (if (no-operands? exps)
      '()
      (let ((x (eval (first-operand exps) env)))
        (cons x (list-of-values (rest-operands exps) env)))))

;; evals right-to-left
(define (list-of-values-r-l exps env)
  (if (no-operands? exps)
      '()
      (let ((xs (list-of-values (rest-operands exps) env)))
        (cons (eval (first-operand exps) env) xs))))

