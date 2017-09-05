# easy_904.rb
def sequence(num)
  num > 0 ? (1..num).to_a : (num..0).to_a.reverse
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
p sequence(-5)
p sequence(0)
