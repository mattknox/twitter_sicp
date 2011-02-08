(def double [* _ 2])
(def halve [/ _ 2])

(def *-naive (a b)
  (if (zero? b)
      0
      (+ a (*-naive a (- b 1)))))

(def *-fast (x y)
  (if (zero? y) 0
      (= y 1) x
      (even? y) (*-fast (double x) (halve y))
      (*-fast (+ x y) (- y 1))))
