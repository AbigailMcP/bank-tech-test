require_relative 'transaction'

class Transactions

  attr_reader :log

  def initialize
    @log = []
  end

  def deposit(time, amount)
    deposit = Transaction.new(time: time, credit: amount)
    @log << deposit
  end

  def withdraw(time, amount)
    withdrawal = Transaction.new(time: time, debit: amount)
    @log << withdrawal
  end

end
