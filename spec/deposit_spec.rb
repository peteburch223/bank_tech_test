require 'deposit'

describe Deposit do

  let(:date) { '10-01-2012' }
  let(:amount) { 1000 }
  let(:deposit) { described_class.new(date: date, amount: amount) }

  it { is_expected.to respond_to :date }
  it { is_expected.to respond_to :amount }

  context('#new') do

    it('stores the date ') do
      expect(deposit.date).to eq date
    end

    it('stores the deposit amount') do
      expect(deposit.amount).to eq amount
    end
  end
end
