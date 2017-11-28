# med_206.rb - Test Prompt For Payment Method - Transaction
require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class TransactionTest < Minitest::Test
  def setup
    @transaction = Transaction.new(25)
  end

  def test_prompt_for_payment
    input = StringIO.new("25")
    @transaction.prompt_for_payment(input: input)

    assert_equal(25, @transaction.amount_paid)
  end
end
