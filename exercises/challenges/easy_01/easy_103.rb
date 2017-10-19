# easy_103.rb - Octal
class Octal
  attr_reader :octal
  
  def initialize(octal)
    @octal = octal
  end
  
  def to_decimal
    octal_array = get_octal_parts
    digits = convert_to_b10_digits(octal_array)
    digits.map.with_index { |n, i| n * 10 ** i }.reduce(:+).to_i
  end
  
  def get_octal_parts
    octal_array = octal.chars.map(&:to_i)
    remainder = octal.to_i
    octal_array.map!.with_index do |d, i|
      division = remainder.divmod(8**(octal_array.size - (i + 1)))
      remainder = division.last
      division.first * 8**(octal_array.size - (i + 1))
    end
  end
  
  def convert_to_b10_digits(array)
    array.reverse.map!.with_index { |n, i| n * 8 ** -i }
  end
end

p Octal.new('10').to_decimal
=begin
- given an octal, convert it back to digit (base 10)
- base 10 is each digit to the d**idx working right to left 233 = 2*10^2 + ...
  - 128 + 24 + 3
- split the octal back into it's original parts
  - use a looping divmod utilizing the base
    - make sure to divide the number and mutliply the quotient
    - store into two diff arrays and repeat until iteration complete
- perform an inverse of **
- sum the numbers
=end