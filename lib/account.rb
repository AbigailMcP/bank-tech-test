require_relative 'transactions'
require_relative 'statement'

class Account

attr_reader :balance, :transactions

INITIAL_BALANCE = 0

  def initialize
    @balance = INITIAL_BALANCE
    @transactions = transactions || Transactions.new
  end

  def deposit(time = Time.now, amount)
    @balance += amount
    transactions.deposit(time, amount, balance)
  end

  def withdraw(time = Time.now, amount)
    check_funds(amount)
    @balance -= amount
    transactions.withdraw(time, amount, balance)
  end

  def print_statement
    statement = Statement.new(transactions)
    statement.printify
  end

  private

  def check_funds(amount)
    fail 'Insufficient funds' if balance < amount
  end

end
