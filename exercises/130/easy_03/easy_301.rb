# easy_301.rb - Boolean Assertions
require 'minitest/autorun'

class MiscTest < Minitest::Test
  def test_boolean
    assert value.odd?, 'value is not odd'
  end
end
