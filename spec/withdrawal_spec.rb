require 'withdrawal'

describe Withdrawal do

  let(:date) { '10-01-2012' }
  let(:amount) { 1000.00 }
  let(:balance) { 2000.00 }

  let(:withdrawal) { described_class.new(date: date, amount: amount, balance: balance) }

  context('#new') do

    it('stores the date ') do
      expect(withdrawal.date.strftime("%d-%m-%Y")).to eq date
    end

    it('stores the withdrawal amount') do
      expect(withdrawal.value).to eq -amount
    end

    it('calculates the balance from the amount and starting balance') do
      expect(withdrawal.balance).to eq balance - amount
    end
  end
end
