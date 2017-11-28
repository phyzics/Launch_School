# easy_10.rb - What's my bonus?

def calculate_bonus(salary, bonus)
  return salary / 2 if bonus == true
  0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000

=begin
utp:
- 2 args
  - +int and a boolean (t/f)
- if t, bonus is 1/2 salary; if f, bonus is 0
- questions
  - assume salary is even? if not, do I return a float if the salary is odd and
    there is a bonus?

data:
i: int and boolean
o: int

test cases:
puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000

algorithm:
- if bonus is true, return 1/2 the salary, if not, return 0


=end
