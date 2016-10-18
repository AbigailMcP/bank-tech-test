require 'account'

describe Account do

  subject(:account) { described_class.new }

  let(:Transactions) { double :Transactions }
  let(:transactions) { double :transactions }

  before(:each) do
    allow(Transactions).to receive(:new) { transactions }
    allow(transactions).to receive(:deposit)
  end

  it 'has an initial balance of nil' do
    expect(account.balance).to eq 0
  end

  describe '#deposit' do
    it 'increases the balance by the deposit amount' do
      expect{ account.deposit(1000) }.to change{ account.balance }.by 1000
    end

    it 'stores a deposit in the transaction log' do
      account.deposit(1000)
      expect(transactions).to have_received(:deposit).with(1000)
    end
  end

  describe '#withdraw' do
    it 'decreases the balance by the withdrawal amount' do
      account.deposit(1000)
      expect{ account.withdraw(1000) }.to change{ account.balance }.by -1000
    end

    it 'does not withdraw more than the current balance' do
      expect{ account.withdraw(1000) }.to raise_error 'Insufficient funds'
    end
  end

end
