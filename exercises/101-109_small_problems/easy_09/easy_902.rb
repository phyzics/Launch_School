# easy_902.rb - Double Doubles
def twice(num)
  arr1 = []
  arr2 = []
  num.digits.each_with_index do |n, i|
    arr1 << n if i < num.digits.size/2
    arr2 << n if i >= num.digits.size/2
  end
  arr1.flatten
  arr2.flatten
  if arr1 != arr2
    num * 2
  else
    num
  end
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) #== 10

=begin
utp:
- double num = even digits, left and right are identical
- return num doubled unless it is a double number
data:
- i/o: int
tc:
  twice(37) == 74
  twice(44) == 44
  twice(334433) == 668866
  twice(444) == 888
  twice(107) == 214
  twice(103103) == 103103
  twice(3333) == 3333
  twice(7676) == 7676
  twice(123_456_789_123_456_789) == 123_456_789_123_456_789
  twice(5) == 10
alg:
- check if double num
  - use digits and then partition to get two arrays, splitting on the s/2 idx
  - call sort on both, and do a comparison
    - return if true, double if false
=end
