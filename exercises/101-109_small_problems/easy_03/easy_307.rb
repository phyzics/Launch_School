# easy_307.rb - Odd Lists
def oddities(arr)
  # way number 1
    #return_arr = []
    #arr.each_with_index { |val, idx| return_arr << val if idx.even? }
    #return_arr
  # way number 2
    #index = -1
    #arr.select do |value|
    #  index += 1
    #  if index.even?
    #    true
    #  else
    #    false
    #  end
    #end
  # way number 3
  index = 0
  arr.each_with_object([]) do |ele, r_arr|
    r_arr << ele if index.even?
    index += 1
  end
end

puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []

=begin
utp:
- returns new array w/ elements at even indecies
data:
- i/o: array
ec:
- adding indecies in the argument
tc:
  oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
  oddities(['abc', 'def']) == ['abc']
  oddities([123]) == [123]
  oddities([]) == []
alg:
- use # each_index and << elements with even indecies into return array
=end
