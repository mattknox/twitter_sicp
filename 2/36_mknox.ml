let rec foldr f v l =
match l with [] -> v
  |   x::xs -> f x (foldr f v xs);;

let prod = foldr (function a -> function x -> a * x) 1;;
(prod [1;2;3;4], prod [1;2;3;4;5]);;
