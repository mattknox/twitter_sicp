:: wrap-with-counter ( quot -- wrapped )
    0 :> count! [ { { "count" [ count ]  }
                    { "reset" [ 0 count! ] }
                    [ 1 count + count! quot call ] }
                  case ] ;
