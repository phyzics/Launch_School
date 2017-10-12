# med_205.rb - Test Give Receipt Method - Cash Register
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

  def test_give_receipt
    output = <<~OUTPUT.chomp
    You've paid $25.
    OUTPUT

    stdout = capture_io { @register.give_receipt(@transaction) }
    assert_equal(output, stdout.first.chomp)
  end
end
