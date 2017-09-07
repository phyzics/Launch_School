# medium_102.rb - Rotation (Part 2)
def rotate_array(arr, num)
  return_arr = arr.clone
  num-1.times do
    moved_ele = return_arr.shift
    return_arr << moved_ele
  end
  return_arr
end

def rotate_rightmost_digits(num, shifts)
  arr = num.to_s.chars
  sub_arr = arr.slice!(-shifts..-1)
  sub_arr = rotate_array(sub_arr, shifts)
  (arr + sub_arr).join.to_i
end

  p rotate_rightmost_digits(735291, 1) == 735291
  p rotate_rightmost_digits(735291, 2) == 735219
  p rotate_rightmost_digits(735291, 3) == 735912
  p rotate_rightmost_digits(735291, 4) == 732915
  p rotate_rightmost_digits(735291, 5) == 752913
  p rotate_rightmost_digits(735291, 6) == 352917

=begin
utp:
- takes digits of number, shifts it 'shifts' digits
  - 1 returns original number
data:
- i/o: integer
tc:
  p rotate_rightmost_digits(735291, 1) == 735291
  p rotate_rightmost_digits(735291, 2) == 735219
  p rotate_rightmost_digits(735291, 3) == 735912
  p rotate_rightmost_digits(735291, 4) == 732915
  p rotate_rightmost_digits(735291, 5) == 752913
  p rotate_rightmost_digits(735291, 6) == 352917
alg:
- get number into an array format
  - array.digits.reverse
  - slice and save an array of [-1, -shifts]
- change rotate_array so that it moves to appropriate spot
=end
