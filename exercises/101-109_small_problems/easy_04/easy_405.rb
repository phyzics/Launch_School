# easy_405.rb - Multiples of 3 and 5
def multisum(num)
  (1..num).select { |n| n % 3 == 0 || n % 5 == 0 }.reduce(:+)
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168

=begin
utp:
- searches for multiples of 3 and 5 from 1..num and adds them all together
data:
- i/o: int
tc:
  multisum(3) == 3
  multisum(5) == 8
  multisum(10) == 33
  multisum(1000) == 234168
alg:
- call select on range, choosing multiples of 3 and 5, then reducing

=end
