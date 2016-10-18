class Account

INITIAL_BALANCE = 0

attr_reader :balance

  def initialize
    @balance = INITIAL_BALANCE
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    fail 'Insufficient funds' if @balance < amount
    @balance -= amount
  end

end
