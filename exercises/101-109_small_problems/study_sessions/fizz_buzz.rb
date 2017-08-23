# fizz_buzz.rb
require 'pry'
def fizz_buzz(num1, num2)
  arr = (num1..num2).to_a.map do |ele|
    if ele == 0
      ele
    elsif ele % 3 == 0 && ele % 5 == 0
      'fizzbuzz'
    elsif ele % 3 == 0
      'fizz'
    elsif ele % 5 == 0
      'buzz'
    else
      ele
    end
  end
  arr.join(", ")
  #binding.pry
end

puts fizz_buzz(0, 15) == '0, 1, 2, fizz, 4, buzz, fizz, 7, 8, fizz, buzz, 11, fizz, 13, 14, fizzbuzz'

=begin
utp:
- 2 args, ints
- print all between
  - if /by3 = fizz, 5 buzz, both fizzbuzz
- return string

data:
i: ints
o: str

edge:
- int? float?
- + or -?

algorithm
- create arr (s..e); iterate w/ index if %3 == 0 - fizz, 5 buzz, both
array.join (", ") change remove last 2


=end
