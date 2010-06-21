class Account
  class BadPassword < StandardError;  end

  BAD_PASSWORD_ATTEMPT_LIMIT = 5
  attr_reader :balance

  def initialize(balance, password)
    @password = [password]
    @balance = balance
    @badattempts = 0
  end

  def add_password(oldpass, newpass)
    ensure_valid_password? oldpass
    @password << newpass
  end

  def ensure_valid_password? pass
    if @password.member? pass
      @badattempts = 0
    elsif @badattempts >= BAD_PASSWORD_ATTEMPT_LIMIT
      raise BadPassword
      call_cops
    else
      @badattempts += 1
      raise BadPassword
    end
  end

  def call_cops
    puts "calling cops"
  end

  def withdraw(amount, pass)
    ensure_valid_password? pass
    if @balance > amount
      amount
    else
      puts "insufficient balance"
    end
  end
end
