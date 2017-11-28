# easy_103.rb - Octal
class Octal
  attr_reader :octal

  def initialize(oct)
    @octal = oct
  end

  def to_decimal
    return 0 if invalid_input?
    octal_array = octal.chars.map(&:to_i)
    octal_array.reverse.map.with_index { |n, i| n * 8**i }.reduce(:+)
  end

  private

  def invalid_input?
    true if octal.match(/[a-z89]/i)
  end
end

p Octal.new('8').to_decimal
