class Statement

  def initialize(transactions, balance)
    @transactions = transactions
    @balance = balance
  end

  # def printify
  #   @transactions.log.each do |transaction|
  #     puts "#{transaction.time} + || #{transaction.credit} + || #{transaction.debit}"
  #   end
  # end

end
