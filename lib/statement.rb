class Statement

  def initialize(transactions)
    @transactions = transactions
  end

  def printify
    header
    formatted_transactions
  end

  private

  def formatted_transactions
    @transactions.log.map do |transaction|
      date = transaction.time.strftime("%d/%m/%Y")
      puts "#{date} || #{transaction.credit} || #{transaction.debit} || #{transaction.balance}"
    end
  end

  def header
    puts 'date || credit || debit || balance'
  end
end
