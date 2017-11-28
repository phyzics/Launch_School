# easy_408.rb - Convert a String to a Signed Number!
DIGIT_KEY = {
  '0' => 0,
  '1' => 1,
  '2' => 2,
  '3' => 3,
  '4' => 4,
  '5' => 5,
  '6' => 6,
  '7' => 7,
  '8' => 8,
  '9' => 9
}

def negative?(str)
  return true if str[0] == '-'
  false
end

def string_to_signed_integer(str)
  negative = negative?(str)
  str.slice!(0) if str[0] == '+' || str[0] == '-'

  return_num = 0
  indx = 0
  str.size.times do
    base = 10 ** (str.size - (indx + 1))
    digit = DIGIT_KEY[str[indx]]
    return_num += (digit * base)
    indx += 1
  end

  return_num *= -1 if negative == true
  return_num
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100
