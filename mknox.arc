; want to make a bunch of macros like this for +=, -=, /=, *=, etc.
; (mac -= (var val) `(do (= ,var (- ,var ,val)) ,var))
; but that's tedious.  So instead I want to write a macro that does it.

(def makesym args (sym (string args)))

(mac defop= (op) `(mac ,(makesym  op "=") (var val) ,(list 'quasiquote `(do (= ,',var (,op ,',var ,',val)) ,',var))))
