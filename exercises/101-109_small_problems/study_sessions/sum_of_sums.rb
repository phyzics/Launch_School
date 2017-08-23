# array of numbers
def sum_of_sums(arr)
  adds = []
  total = 0
  arr.each do |num|
    adds << num
    total += adds.reduce(:+)
  end
  total
end

puts sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
puts sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
puts sum_of_sums([4]) == 4
puts sum_of_sums([1, 2, 3, 4, 5]) == 35
=begin

utp:
- take array of numbers, return sums

data
- i: array
- o: int

algorithm
- put items into a new array and iterate via reduce
=end
