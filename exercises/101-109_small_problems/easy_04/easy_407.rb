# easy_407.rb - Convert a String to a Number!
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

def string_to_integer(str)
  return_num = 0
  indx = 0
  str.size.times do
    base = 10 ** (str.size - (indx + 1))
    digit = DIGIT_KEY[str[indx]]
    return_num += (digit * base)
    indx += 1
  end
  return_num
end

p string_to_integer('4321')
p string_to_integer('570')
p string_to_integer('1')

=begin
utp:
- create a string to integer method without using .to_s or Integer(), etc
data:
-i: string
-o: int
tc:
  string_to_integer('4321') == 4321
  string_to_integer('570') == 570
alg:
- set up a formula that gets a base value, iterate and multiply down, adding
  each result
=end
