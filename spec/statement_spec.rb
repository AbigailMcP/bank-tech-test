require 'statement'

describe Statement do

  subject(:statement) { described_class.new(transactions) }
  let(:transactions) { double :transactions }
  let(:transaction) { double :transaction }
  let(:transaction1) { double :transaction, time: @time_now, credit: 1000, debit: 0, balance: 1000 }
  let(:transaction2) { double :transaction, time: @time_now, credit: 0, debit: 1000, balance: 0 }

  before(:each) do
    @time_now = Time.now
    allow(Time).to receive(:now).and_return(@time_now)
    allow(transactions).to receive(:log).and_return([transaction1, transaction2])
  end

  describe '#printify' do
    it 'prints out a formatted list of transactions' do
      string = "date || credit || debit || balance\n18/10/2016 || 1000 || 0 || 1000\n18/10/2016 || 0 || 1000 || 0\n"
      expect{ statement.printify }.to output(string).to_stdout
    end
  end
end
