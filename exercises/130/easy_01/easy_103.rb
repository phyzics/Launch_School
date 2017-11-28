# easy_103.rb - Find Missing Numbers
def missing(arr)
  return [] if arr.size == 1

  missing_num_arr = []
  (arr.min..arr.max).each do |num|
    missing_num_arr << num if arr.include?(num) == false
  end

  missing_num_arr
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []
