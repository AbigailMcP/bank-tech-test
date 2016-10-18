require_relative 'transaction'

class Transactions

  attr_reader :log

  def initialize
    @log = []
  end

  def deposit(amount)
    deposit = Transaction.new(amount)
    @log << deposit
  end

  def withdraw(amount)
    withdrawal = Transaction.new(amount)
    @log << withdrawal
  end

end
