class Transaction

  attr_reader :time, :credit, :debit, :balance

  def initialize(time: 0, credit: 0, debit: 0, balance: 0)
    @time = time
    @credit = credit
    @debit = debit
    @balance = balance
  end

end
