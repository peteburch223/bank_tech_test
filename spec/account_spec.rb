require 'account'

describe Account do

  let (:deposit) { double :deposit_instance, date: '10-01-2012', amount: 1000, balance: 0  }
  let (:withdrawal) { double :withdrawal_instance, date: '14-01-2012', amount: -500, balance: 1000  }

  let (:deposit_class) { double Deposit, new: deposit }
  let (:withdrawal_class) { double Withdrawal, new: withdrawal}

  subject (:account) { described_class.new(deposit_class: deposit_class,
                                           withdrawal_class: withdrawal_class) }

  describe '#transactions' do
    it 'returns an array of transactions' do
      account.deposit(date:deposit.date, amount: deposit.amount)
      account.withdraw(date:withdrawal.date, amount: withdrawal.amount)
      expect(account.transactions.count).to eq 2
      expect(account.transactions[0].amount).to eq deposit.amount
    end
  end

  describe '#deposit' do
    it 'increases the length of the transactions array' do
      expect{ account.deposit(date:deposit.date, amount: deposit.amount) }.to change{ account.transactions.count }.by(1)
    end

    it 'stores the deposit in the transactions array' do
      account.deposit(date:deposit.date, amount: deposit.amount)
      expect(account.transactions.last.amount).to eq deposit.amount
    end
  end

  describe '#withdraw' do
    it 'increases the length of the transactions array' do
      expect{ account.withdraw(date:withdrawal.date, amount: withdrawal.amount) }.to change{ account.transactions.count }.by(1)
    end

    it 'stores the withdrawal in the transactions array' do
      account.withdraw(date:withdrawal.date, amount: withdrawal.amount)
      expect(account.transactions.last.amount).to eq withdrawal.amount
    end
  end

end
