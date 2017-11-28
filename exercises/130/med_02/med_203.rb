# med_203.rb - Test Accept Money Method - Cash Register
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

  def test_accept_money
    @transaction.amount_paid = 25
    assert_equal(1025, @register.accept_money(@transaction))
  end
end
