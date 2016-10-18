require_relative 'transactions'

class Account

INITIAL_BALANCE = 0

attr_reader :balance, :transactions

  def initialize
    @balance = INITIAL_BALANCE
    @transactions = transactions || Transactions.new
  end

  def deposit(amount, time = Time.now)
    @balance += amount
    transactions.deposit(amount, time)
  end

  def withdraw(amount, time = Time.now)
    check_funds(amount)
    @balance -= amount
    transactions.withdraw(amount, time)
  end

  private

  def check_funds(amount)
    fail 'Insufficient funds' if @balance < amount
  end

end
