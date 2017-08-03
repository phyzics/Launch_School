# easy_03.rb

def digit_list(number)
   number.to_s.split(//).map { |num| num.to_i }
end

=begin

utp
- positive integer, and return an array

i/o
- input is an integer
- output will be an array whose elements are integers built from string

test cases

puts digit_list(12345) == [1, 2, 3, 4, 5]
puts digit_list(7) == [7]
puts digit_list(375290) == [3, 7, 5, 2, 9, 0]
puts digit_list(444) == [4, 4, 4]

algorithm
- convert integer to string, split string into an array of individual chars
- map array into integers and return
=end
