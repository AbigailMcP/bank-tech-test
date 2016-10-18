require './lib/transaction'

class Transactions

  attr_reader :log

  def initialize
    @log = []
  end

  def deposit(amount)
    deposit = Transaction.new(amount)
    @log << deposit
  end

end
