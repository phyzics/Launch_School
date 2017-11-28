# medium_110.rb - Fibonacci Numbers (Last Digit)
def fibonacci(nth)
  first, last = [1, 1]
  3.upto(nth) { first, last = [last, last + first] }
  last
end

def fibonacci_last(num)
  fibonacci(num % 60).digits.first
end

p fibonacci_last(123456789987745)
