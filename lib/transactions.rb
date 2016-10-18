require './lib/transaction'

class Transactions

  def initialize
    @log = []
  end

  def deposit(amount)
    deposit = Transaction.new(amount)
    @log << deposit
  end

end
