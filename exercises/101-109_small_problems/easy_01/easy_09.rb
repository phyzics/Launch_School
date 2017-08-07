# easy_09.rb - Sum of Digits

def sum(number)
  number.to_s.chars.map { |digit| digit.to_i }.reduce(:+)
end

=begin
utp:
- 1 arg, + int, return int that is sum of Digits

data:
- i: int
- o: int

test cases:
puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

algorithm:
- convert int to string, split, map as int, reduce and return int

=end
