require 'transaction'

class Withdrawal

  include Transaction

  def amount
    -@amount
  end

end
