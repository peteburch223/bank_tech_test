require 'deposit'

describe Deposit do

  let(:date) { '10-01-2012' }
  let(:amount) { 1000.00 }
  let(:balance) { 1000.00 }

  let(:deposit) { described_class.new(date: date, amount: amount, balance: balance) }


  context('#new') do

    it('stores the date ') do
      expect(deposit.date.strftime("%d-%m-%Y")).to eq date
    end

    it('stores the deposit amount') do
      expect(deposit.value).to eq amount
    end

    it('calculates the balance from the amount and starting balance') do
      expect(deposit.balance).to eq amount + balance
    end
  end
end
