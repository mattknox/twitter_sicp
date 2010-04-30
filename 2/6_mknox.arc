(def ident [_])

(def zero [ident])

(def add-1 (n)
  (fn (f) (fn (x) (f ((n f) x)))))

(def two (f) [(f (f _))])
