# easy_110.rb - Count Items
def count(array)
  array.select { |ele| yield(ele) }.size
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2

=begin
utp:
- array as arg and block
  -block returns boolean depending on value array passes
  - no #count for Array or Enumerable
alg:
- use select to handle the block, then call #size on select return arr
=end
