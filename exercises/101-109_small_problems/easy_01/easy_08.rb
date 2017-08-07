# easy_08.rb - Array Average

def average(arr, dec=0)
  total = arr.reduce(:+)
  total = total.to_f if dec == 1
  total / arr.length
end

=begin

utp:
- 1 arg (array w/ integers)
- return average of int in array
- array never empty, int always +
- nested arrays?

i/o/d:
- array with integers
- integer
- array and integer

test cases:
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40
puts average([5, 3, 7, 8], 1) == 5.75

algorithm:
- iterate and add all the integers together, then divide by array length

=end
