# medium_208.rb - Next Featured Number Higher than a Given Value
def featured(num)
  num += 1
  loop do
    if (num.odd?) && (num % 7 == 0) && (num.digits == num.digits.uniq)
      return num
    elsif num.digits.length > 10
      return "There is no possible number that fulfills those requirements."
    else
      num += 1
    end
  end
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987
p featured(9_999_999_999)
=begin
utp:
- must be odd, multiple 7, and digits are uniq
- return next highest featured number, exception if not possible
data:
- i/o: integer (string for exception)
tc:
  p featured(12) == 21
  p featured(20) == 21
  p featured(21) == 35
  p featured(997) == 1029
  p featured(1029) == 1043
  p featured(999_999) == 1_023_547
  p featured(999_999_987) == 1_023_456_987
  p featured(9_999_999_999)
alg:
- case guard
  - digits.length > 9 return exception
- iterate number and check conditions, return number if true

=end
