# easy_607.rb - Halvsies
def halvsies(arr)
  index = 0
  s_arr1 = []
  s_arr2 = []
  if arr.size.odd?
    arr.each do |ele|
      if index <= arr.size/2
        s_arr1 << ele
      else
        s_arr2 << ele
      end
      index +=1
    end
  else
    arr.each do |ele|
      if index < arr.size/2
        s_arr1 << ele
      else
        s_arr2 << ele
      end
      index += 1
    end
  end
  [s_arr1, s_arr2]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]
=begin
- take array, return two arrays with 1st half and 2nd half
  - if arr length is odd, middle element goes into 1st
  - empty returns two empty arrays
  - single number returns [n], []
data:
- i/o: arr
tc:
  halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
  halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
  halvsies([5]) == [[5], []]
  halvsies([]) == [[], []]
alg
- use partiton to separate elements depending on if index is <= arr.size/2
=end
