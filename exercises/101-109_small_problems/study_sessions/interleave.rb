# array of numbers
def interleave(arr1, arr2)
  index = 0
  final_arr = []
  arr1.size.times do
    final_arr << arr1[index] << arr2[index]
    index += 1
  end
  final_arr.join(", ")
end

p interleave([1, 2, 3], ['a', 'b', 'c'])
=begin

utp:
- take array of numbers, return sums

data
- i: array
- o: int

algorithm
- put items into a new array and iterate via reduce
=end
