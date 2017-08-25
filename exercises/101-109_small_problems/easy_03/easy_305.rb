# easy_305.rb - Squaring an Argument
def multiply(n1, n2)
  n1 * n2
end

def square(num)
  multiply(num, num)
end

def power_to(num, exp)
  return num if exp == 1
  final_number = 1
  exp.times do
    final_number *= multiply(num, 1)
  end
  final_number
end

p power_to(5, 3) ==  125
p power_to(8, 2) == 64
