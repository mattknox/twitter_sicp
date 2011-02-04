(def repeated (f n)
  (if (<= n 1)
      f
      f:(repeated f (- n 1))))
