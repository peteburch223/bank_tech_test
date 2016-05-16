module Transaction

  attr_reader :date

  def initialize (args = {})
    @date = Date.parse args[:date]
    @amount = args[:amount]
    @start_balance = args[:balance]
  end

  def value
    @amount
  end

  def balance
    value + @start_balance
  end
end
