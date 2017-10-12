# med_204.rb - Test Change Method - Cash Register
require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @register = CashRegister.new(1000)
    @transaction = Transaction.new(25)
  end

  def test_change
    @transaction.amount_paid = 60
    assert_equal(35, @register.change(@transaction))
  end
end
