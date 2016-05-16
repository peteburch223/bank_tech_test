require 'transaction'

class Withdrawal
  include Transaction

  def value
    -@amount
  end
end
