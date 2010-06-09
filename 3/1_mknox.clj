; cheating, but sorta cool: uses a clojure accumulator library
(defn genacc [val] (defacc sum + 0))

(defn accum [n]
  (let [acc (atom n)]
    (fn [x] (swap! acc + x))))
