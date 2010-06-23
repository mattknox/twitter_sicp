# ruby arrays are pretty good as dequeues-this turns out to pretty
# much be a no-op.  Here I define a class, but I could just as well
# use naked arrays.

class Dequeue
  def initialize
    @arr = []
  end

  def front
    first
  end

  def rear
    last
  end

  def front_insert!(elt)
    push elt
  end

  def rear_insert!(elt)
    unshift elt
  end

  def front_delete!
    pop
  end

  def rear_delete!
    shift
  end
end
