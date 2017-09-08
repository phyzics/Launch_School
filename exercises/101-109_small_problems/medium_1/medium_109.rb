# medium_109.rb - Fibonacci Numbers (Procedural)
def fibonacci(num)
  return 1 if num <= 2
  result = [1, 1]

  (num - 2).times do
    last_2_num = result.last(2).reduce(:+)
    result << last_2_num
  end
  result.last
end
