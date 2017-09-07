# medium_101.rb - Rotation (Part 1)
def rotate_array(arr)
  return_arr = arr.clone
  moved_ele = return_arr.shift
  return_arr << moved_ele
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

p x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]

=begin
utp:
- move first element to end of array, non-destructive
- cannot use Array#rotate(!)
=end
