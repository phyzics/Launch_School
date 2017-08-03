# easy_02.rb

def is_odd?(number)
  number % 2 != 0
end

# further exploration
def is_certainly_odd?(number)
  number.remainder(2) != 0
end

=begin
utp
- takes 1 interget argument, -, +, or 0
  - returns true if abs val == odd
  - cannot use #odd? or #even?

i/o
- integers

test cases

puts is_odd?(2)
puts is_odd?(5)
puts is_odd?(-17)
puts is_odd?(-8)
puts is_odd?(0)
puts is_odd?(7)

alg
- take input and if % 2 =! 0, then it returns true, o/w returns false

=end
