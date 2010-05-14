(defn run-length-encode [count [current & l]]
     (cond (nil? current) '()
           (empty? l) (list (list count current))
           (= current (first l)) (run-length-encode (inc count) (rest l))
           true (cons (list count current) (run-length-encode 1 l))))
