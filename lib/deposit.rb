
require 'transaction'

class Deposit

  include Transaction

  def value
    @amount
  end
end
