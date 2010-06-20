class Account
  BAD_PASSWORD_ATTEMPT_LIMIT = 5
  attr_reader :balance
  def initialize(balance, password)
    @password = [password]
    @balance = balance
    @badattempts = 0
  end

  def add_password(oldpass, newpass)
    if valid_password? oldpass
      @password << newpass
    else
      puts "bad password"
    end
  end

  def valid_password? pass
    if @password.member? pass
      @badattempts = 0
      true
    elsif @badattempts >= BAD_PASSWORD_ATTEMPT_LIMIT
      call_cops
      false
    else
      @badattempts += 1
      false
    end
  end

  def call_cops
    puts "calling cops"
  end

  def withdraw(amount, pass)
    if valid_password? pass
      if @balance > amount
        amount
      else
        puts "insufficient balance"
      end
    else
      puts "incorrect password, try again."
    end
  end
end
