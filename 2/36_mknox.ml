let rec foldr f v l =
  match l with [] -> y
    |   x::xs -> f x (foldr f xs y);;
