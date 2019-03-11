# easy_07.rb - Stringy Strings
require 'pry'

def string_stringy(number)
  string = '10'

  string = if number.even?
             string = string * (number / 2)
           elsif number.odd? && number != '1'
             string = string * (number / 2) + '1'
           else
             string = '1'
           end
end

def stringy(number, swap=1)
  numbers = []
  index = 0

  if swap == 0
    number.times do
      index.even? ? numbers << '0' : numbers << '1'
      index += 1
    end
  else
    number.times do
      index.even? ? numbers << '1' : numbers << '0'
      index += 1
    end
  end

  numbers.join
end

puts stringy(1) == '1'
puts stringy(1, 0) == '0'
puts stringy(6) == '101010'
puts stringy(6, 0) == '010101'
puts stringy(9) == '101010101'
puts stringy(9, 0) == '010101010'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

=begin
utp
- takes integer and returns string of 1's and 0's
  - string always begins with 1 and then alternates
  - string.length = number

- always a positive integer (don't test 0 or negative or float)

data
- i: number
- o: string
- d: string

test cases:
puts stringy(1) == '1'
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

algorithm
- have a '10' string; concatenate self * int/2 and add '1' if number.odd? = true
- if the number is 1, then just return '1'

=end
