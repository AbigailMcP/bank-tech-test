require 'transactions'

describe Transactions do

  subject(:transactions) { described_class.new }

  let(:Transaction) { double :Transaction }
  let(:transaction) { double :transaction }

  before(:each) do
    allow(Transaction).to receive(:new) { transaction }
    @time_now = Time.now
    allow(Time).to receive(:now).and_return(@time_now)
  end

  describe '#deposit' do
    before(:each) do
      transactions.deposit(@time_now, 1000, 1000)
    end

    it 'creates a deposit' do
      expect(Transaction).to have_received(:new).with(time: @time_now, credit: 1000, balance: 1000)
    end

    it 'stores a deposit in the log' do
      expect(transactions.log).to include transaction
    end
  end

  describe '#withdraw' do
    before(:each) do
      transactions.withdraw(@time_now, 1000, 0)
    end

    it 'creates a withdrawal' do
      expect(Transaction).to have_received(:new).with(time: @time_now, debit: 1000, balance: 0)
    end

    it 'stores a deposit in the log' do
      expect(transactions.log).to include transaction
    end
  end


end
