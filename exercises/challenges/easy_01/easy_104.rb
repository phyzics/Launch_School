# easy_104.rb - Trinary
class Trinary
  attr_reader :trinary

  INVALID = /[^0-2]/

  def initialize(str)
    @trinary = str
  end

  def to_decimal
    trinary =~ INVALID ? 0 : calculate
  end

  def calculate
    indexes = (0..trinary.size - 1).to_a.reverse
    index = -1

    trinary.chars.map(&:to_i).map do |d|
      index += 1
      d * 3 ** indexes[index]
    end.reduce(:+)
  end
end

p Trinary.new('102012').to_decimal
