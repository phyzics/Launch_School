# easy_406.rb - Running Totals
def running_total(arr)
  return_arr = []
  accum = 0
  arr.each { |num| return_arr << accum += num }
  return_arr
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

=begin
utp:
- take array, return array w/ same # elements, elements now running total
data:
-i: array w/ int
-o: array w/ int
ec
- validation, negative, float vs int
tc:
  running_total([2, 5, 13]) == [2, 7, 20]
  running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
  running_total([3]) == [3]
  running_total([]) == []
alg:
- iterate over an index, using range from 0..indx, reduce up to that point and
  << into return array
=end
