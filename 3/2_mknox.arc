(def wrap-with-counter (f)
  (let count 0
   [if (is _ 'count) count
       (is _ 'reset) (zap [+ 0] count)
       (do (++ count)
           (f _))]))
