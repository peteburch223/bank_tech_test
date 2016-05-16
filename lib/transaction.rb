module Transaction

  attr_reader :date, :amount

  def initialize (args = {})
    @date = args[:date]
    @amount = args[:amount]
  end

end
