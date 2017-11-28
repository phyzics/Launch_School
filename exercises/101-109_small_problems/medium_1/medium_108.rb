# medium_108.rb - Fibonacci Numbers (Recursion)
def fibonacci(num)
  return 1 if num == 1
  return 0 if num < 1
  fibonacci(num - 1) + fibonacci(num - 2)
end
