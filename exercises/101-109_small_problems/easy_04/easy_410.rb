# easy_410.rb - Convert a Signed Number to a String!
DIGITS = %(0123456789)

def integer_to_string(num)
  return_str = ''
  loop do
    number, remainder = num.divmod(10)
    return_str.prepend(DIGITS[remainder])
    num = number
    break if number == 0
  end
  return_str
end

def signed_integer_to_string(num)
  if num > 0 || num == 0
    integer_to_string(num)
  else
    integer_to_string((num * -1)).prepend('-')
  end
end

p signed_integer_to_string(4321) == '4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'
