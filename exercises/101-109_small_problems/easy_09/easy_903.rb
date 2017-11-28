# easy_903.rb - Always Return Negative
def negative(num)
  return num * -1 if num > 0
  num
end

p negative(5)
p negative(-3)
p negative(0)
