class Account

  def initialize (deposit_class: Deposit, withdrawal_class: Withdrawal)
    @deposit_class = deposit_class
    @withdrawal_class = withdrawal_class
    @initial_balance = 0.0
    @transactions = []
  end
  #
  # def balance
  #   @transactions.reduce(@initial_balance){ |total, transaction| total += transaction.amount }
  # end

  def deposit (args)
    balance = transactions.last.nil? ? 0 : transactions.last.balance
    @transactions.push @deposit_class.new(date: args[:date], amount: args[:amount], balance: balance)
  end

  def withdraw (args)
    balance = transactions.last.nil? ? 0 : transactions.last.balance
    @transactions.push @withdrawal_class.new(date: args[:date], amount: args[:amount], balance: balance)
  end

  def transactions
    @transactions.dup
  end

end
