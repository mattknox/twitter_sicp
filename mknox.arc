(mac -= (var val) `(do (= ,var (- ,var ,val)) ,var))
(mac defop= (op) `(mac ,(sym (+ "" op "=")) (var val) ,(list 'quasiquote `(do (= ,',var (,op ,',var ,',val)) ,',var))))

(mac defop= (op) `(mac (sym (+ "" op "=")) (var val) ,(list 'quasiquote `(do (= ,',var (,op ,',var ,',val)) ,',var))))

(mac defop= (op) (list 'mac (sym (+ "" op "=")) '(var val) (list 'quasiquote `(do (= ,',var (,op ,',var ,',val)) ,',var))))
