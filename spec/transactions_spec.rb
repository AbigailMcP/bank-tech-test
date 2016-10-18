require 'transactions'

describe Transactions do

  subject(:transactions) { described_class.new }

  let(:Transaction) { double :Transaction }
  let(:transaction) { double :transaction }

  before(:each) do
    allow(Transaction).to receive(:new) { transaction }
  end

  describe '#deposit' do
    before(:each) do
      transactions.deposit(1000)
    end

    it 'creates a deposit' do
      expect(Transaction).to have_received(:new)
    end

    it 'stores a deposit in the log' do
      expect(transactions.log).to include transaction
    end
  end


end
