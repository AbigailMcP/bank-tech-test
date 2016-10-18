require_relative 'transactions'

class Account

INITIAL_BALANCE = 0

attr_reader :balance, :transactions

  def initialize
    @balance = INITIAL_BALANCE
    @transactions = transactions || Transactions.new
  end

  def deposit(amount)
    @balance += amount
    transactions.deposit(amount)
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
