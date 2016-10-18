require 'account'

describe Account do

  subject(:account) { described_class.new }

  let(:Transactions) { double :Transactions }
  let(:transactions) { double :transactions, deposit: nil, withdraw: nil }
  let(:Statement) { double :Statement }
  let(:statement) { double :statement, printify: nil }

  before(:each) do
    allow(Transactions).to receive(:new) { transactions }
    allow(Statement).to receive(:new) { statement }
    @time_now = Time.now
    allow(Time).to receive(:now).and_return(@time_now)
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
      expect(transactions).to have_received(:deposit).with(@time_now, 1000, 1000)
    end
  end

  describe '#withdraw' do
    before(:each) do
      account.deposit(1000)
    end

    it 'decreases the balance by the withdrawal amount' do
      expect{ account.withdraw(1000) }.to change{ account.balance }.by -1000
    end

    it 'stores a withdrawal in the transaction log' do
      account.withdraw(1000)
      expect(transactions).to have_received(:withdraw).with(@time_now, 1000, 0)
    end

    it 'does not withdraw more than the current balance' do
      expect{ account.withdraw(2000) }.to raise_error 'Insufficient funds'
    end
  end

  describe '#print_statment' do
    it 'creates a new statement' do
      account.print_statement
      expect(Statement).to have_received(:new).with(transactions)
    end
  end

end
