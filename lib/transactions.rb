require_relative 'transaction'

class Transactions

  def initialize
    @log = []
  end

  def deposit(time, amount, balance)
    deposit = Transaction.new(time: time, credit: amount, balance: balance)
    log << deposit
  end

  def withdraw(time, amount, balance)
    withdrawal = Transaction.new(time: time, debit: amount, balance: balance)
    log << withdrawal
  end

  attr_reader :log

end
