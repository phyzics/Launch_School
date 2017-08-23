# reversed_number.rb

def reversed_number(number)
  number.to_s.reverse
end

puts reversed_number(12345) == 54321
puts reversed_number(12213) == 31221
puts reversed_number(456) == 654
puts reversed_number(12000) == 21 # Note that zeros get dropped!
puts reversed_number(1) == 1

=begin
utp:
- takes positive integer and returns digits reversed
- 0's need to be dropped

data:
- i: integer
- o: integer
- d: int and str

test cases:
reversed_number(12345) == 54321
reversed_number(12213) == 31221
reversed_number(456) == 654
reversed_number(12000) == 21 # Note that zeros get dropped!
reversed_number(1) == 1

algorithm:
- convert int to string then array of chars; reverse the array then join
- check for 0, if exist, delete -- use select


=end
