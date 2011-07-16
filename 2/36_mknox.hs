foldr f v [] = v
foldr f v (x:xs)  = f v (f v xs)
