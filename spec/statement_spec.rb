require 'statement'

describe Statement do

  let(:account) { double Account}

  let (:deposit1) { double :deposit_instance, date: Date.parse('10-01-2012'), value: 1000, balance: 1000  }
  let (:deposit2) { double :deposit_instance, date: Date.parse('13-01-2012'), value: 2000, balance: 3000  }
  let (:withdrawal) { double :withdrawal_instance, date: Date.parse('14-01-2012'), value: -500, balance: 2500  }



  subject(:statement) { described_class.new}


  describe '#print_row' do
    it 'is correctly formatted for a deposit' do
      expect{ statement.row_text(deposit1) }.to output("10/01/2012 || 1000.00 || || 1000.00\n").to_stdout
    end

    it 'is correctly formatted for a withdrawal' do
      expect{ statement.row_text(withdrawal) }.to output("14/01/2012 || || 500.00 || 2500.00\n").to_stdout
    end
  end

  describe '#print' do
    it ('creates a new statement with transactions sorted most recent first') do
      allow(account).to receive(:transactions).and_return [deposit1, deposit2, withdrawal]
      expect{ statement.print(account) }.to output("date || credit || debit || balance\n" +
                                                   "14/01/2012 || || 500.00 || 2500.00\n" +
                                                   "13/01/2012 || 2000.00 || || 3000.00\n" +
                                                   "10/01/2012 || 1000.00 || || 1000.00\n").to_stdout

    end
  end

  describe '#header_text' do
    it { expect{ statement.header_text } .to output("date || credit || debit || balance\n").to_stdout }
  end

end
