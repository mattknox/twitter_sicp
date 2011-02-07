(def acc (f nullv term a b next)
  (if (> a b)
      nullv
      (acc f (f (term a) nullv) term (next a) next)))

(def (sum term a b next)
  (acc + 0 term a b next))
