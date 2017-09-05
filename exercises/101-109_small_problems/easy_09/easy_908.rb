# easy_908.rb - Sequence Count
def sequence(num1, num2)
  return [] if num1 == 0
  result = []
  (1..num1).each { |n| result << n * num2 }
  result
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []

=begin
utp:
- takes 2 integers, first is count, second is first number of sequence
- returns arr with num1 integers, each element being idx * num2
- 0 for num 1 returns []
data:
-i/o: array with integers
ec: negative number for num1
tc:
  sequence(5, 1) == [1, 2, 3, 4, 5]
  sequence(4, -7) == [-7, -14, -21, -28]
  sequence(3, 0) == [0, 0, 0]
  sequence(0, 1000000) == []
alg:
- set a guard for num1 == 0
- set up a return array, iterate through 1..num1, multiply each by num 2 and <<
=end
