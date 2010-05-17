# This class solves the Towers of Hanoi problem.
# The location of every disk is stored in a single array

class HanoiState
  PEGS = [1, 2, 3]
  # this represents the current state of a set of towers of hanoi with
  # a single array of peg numbers
  attr_accessor :disks

  def initialize(size)
    @disks = [1] * size
  end

  def other_peg(n, to)
    (PEGS - [to, disks[n]]).first
  end

  def move_stack(n, to)
    # moves the stack starting at disk n to peg number to
    puts "moving stack #{n} to #{to}.  current state is: #{disks}"
    move_stack(n - 1, other_peg(n, to)) if n > 0
    move_disk(n, to)
    move_stack(n - 1, to) if n > 0
  end

  def move_disk(n, to)
    puts "moving #{n} to #{to}.  current state is: #{disks}"
    disks[n] = to if can_move?(n, to)
    puts "new state is #{disks}"
  end

  def can_move?(n, to)
    !disks[0..n].any? { |d| d == to }
  end
end
