# easy_606.rb - Reversed Arrays (Part 2)
def reverse(arr)
  return_arr = []
  arr.each { |ele| return_arr.unshift(ele) }
  return_arr
end

def reverse2(arr)
  arr.each_with_object([]) { |e, a| a.unshift(e) }
end

p reverse2([1,2,3,4]) == [4,3,2,1]          # => true
p reverse2(%w(a b c d e)) == %w(e d c b a)  # => true
p reverse2(['abc']) == ['abc']              # => true
p reverse2([]) == []                        # => true

p list = [1, 2, 3]                      # => [1, 2, 3]
p new_list = reverse2(list)              # => [3, 2, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 2, 3]                     # => true
p new_list == [3, 2, 1]                 # => true
