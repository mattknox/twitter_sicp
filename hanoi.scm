(include (file "/Users/mknox/h/twitter_sicp/1/mknox.scm"))
; this is a solution to the towers of hanoi
; a tower state looks like this:  ((1 2 3 4)()())
; to move the 1-4 stack to rod 2, we first must move the 1-3 stack to rod 3.
; to move the 1-3 stack to rod 3, we first must move the 1-2 stack to rod 2.
; to move the 1-2 stack to rod 2, we first must move the 1 stack to rod 3.

(define (hanoi size))

(define (move_stack stack n to))

(define (move_disk stack n to))

(define (can_move? stack n to))
