
def include?(arr, val)
  arr.each { |n| return true if n == val }
  false
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false

=begin
utp:
- take arr, search value as arg
  return if in, else return false
=end
