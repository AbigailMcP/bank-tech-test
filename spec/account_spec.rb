require 'account'

describe Account do

  subject(:account) { described_class.new }

  it 'has an initial balance of nil' do
    expect(account.balance).to eq 0
  end

end
