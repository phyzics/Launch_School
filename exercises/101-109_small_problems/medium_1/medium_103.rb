# medium_103.rb - Rotation (Part 3)
def rotate_array(arr, num)
  return_arr = arr.clone
  num-1.times do
    moved_ele = return_arr.shift
    return_arr << moved_ele
  end
  return_arr
end

def max_rotation(num)
  num_arr = num.to_s.chars
  idx = 0
  freeze_arr = []
  loop do
    num_arr = rotate_array(num_arr, 1)
    freeze_arr << num_arr.slice!(0)
    idx += 1
    break if num_arr.empty?
  end
  freeze_arr.join.to_i
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845

=begin
utp:
- take number, perform maximum Rotation
  - rotate once, and then keep rotating through while freezing 1 more each time
data:
- i/o: integers
tc:
  p max_rotation(735291) == 321579
  p max_rotation(3) == 3
  p max_rotation(35) == 53
  p max_rotation(105) == 15 # the leading zero gets dropped
  p max_rotation(8_703_529_146) == 7_321_609_845
alg:
- keep track of shift count, stop when shift count == size-1

735291
352917
329175
321759
321597
321579
=end
