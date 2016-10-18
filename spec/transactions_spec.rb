require 'transactions'

describe Transactions do

  subject(:transactions) { described_class.new }

  let(:Transaction) { double :Transaction }
  let(:transaction) { double :transaction }

  before(:each) do
    allow(Transaction).to receive(:new) { transaction }
  end

  it 'records a deposit' do
    transactions.deposit(1000)
    expect(Transaction).to have_received(:new)
  end

end
