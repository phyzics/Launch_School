# easy_809.rb - Convert number to reversed array of digits
def reversed_number(num)
  num.to_s.reverse.to_i
end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # Note that zeros get dropped!
p reversed_number(1) == 1

=begin
utp:
- take + integer, returns number with digits reversed
data:
- i/o: integer
tc:
  reversed_number(12345) == 54321
  reversed_number(12213) == 31221
  reversed_number(456) == 654
  reversed_number(12000) == 21 # Note that zeros get dropped!
  reversed_number(1) == 1
alg:
- to_s, reverse, to_i

=end
