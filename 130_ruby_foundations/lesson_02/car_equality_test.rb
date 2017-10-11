# car_equality_test
require 'minitest/autorun'

require_relative 'car'

class CarTest < Minitest::Test
  def test_value_equality
    car1 = Car.new
    car2 = Car.new

    car1.name = "Kim"
    car2.name = "Kim"

    assert_equal(car1, car2)
    assert_same(car1, car2)
  end
end
