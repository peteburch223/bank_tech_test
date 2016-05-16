require 'account'

describe Account do

  let (:deposit) { double :deposit_instance, date: '10-01-2012', amount: 1000  }
  let (:withdrawal) { double :withdrawal_instance, date: '14-01-2012', amount: -500  }

  let (:deposit_class) { double Deposit, new: deposit }
  let (:withdrawal_class) { double Withdrawal, new: withdrawal}

  subject (:account) { described_class.new(deposit_class: deposit_class,
                                           withdrawal_class: withdrawal_class) }

  it { is_expected.to respond_to :deposit }
  it { is_expected.to respond_to :withdraw }
  it { is_expected.to respond_to :print_statement }

  it { is_expected.to respond_to :balance }

  describe '#deposit' do
    it 'increases the account balance by the amount deposited' do
      account.deposit(date:deposit.date, amount: deposit.amount)
      expect(account.balance).to eq deposit.amount
    end
  end

  describe '#withdraw' do
    it 'reduces the account balance by the amount withdrawn' do
      account.withdraw(date:withdrawal.date, amount: withdrawal.amount)
      expect(account.balance).to eq withdrawal.amount
    end
  end

  describe '#balance' do
    it 'has a starting balance of zero' do
      expect(account.balance).to eq 0
    end

    it 'returns the total of all deposits and withdrawals' do

      expected_balance = deposit.amount + withdrawal.amount

      account.deposit(date:deposit.date, amount: deposit.amount)
      account.withdraw(date:withdrawal.date, amount: withdrawal.amount)
      expect(account.balance).to eq expected_balance
    end
  end
end
