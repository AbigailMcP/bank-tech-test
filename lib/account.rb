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
    check_funds(amount)
    @balance -= amount
  end

  private

  def check_funds(amount)
    fail 'Insufficient funds' if @balance < amount
  end

end
