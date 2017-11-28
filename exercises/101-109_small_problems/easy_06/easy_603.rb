# easy_603.rb - Fibonacci Number Location By Length
def fibonacci_equation(n1, n2=1)
  (n1 + n2)
end

def find_fibonacci_index_by_length(digits)
  f_arr = [1]
  index = 0
  loop do

    if f_arr[index].to_s.size == digits
      return index + 1
    elsif index >= 1
      index += 1
      f_arr[index] = 1
      f_arr[index] = fibonacci_equation(f_arr[index - 1], f_arr[index - 2])
    else
      index += 1
      f_arr[index] = 1
    end
  end
end

p find_fibonacci_index_by_length(2) == 7
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847

=begin
utp:
- takes int, calculates index of first fib # that has # of digits specified
- arg always >= 2
data:
- i/o: int
tc:
  find_fibonacci_index_by_length(2) == 7
  find_fibonacci_index_by_length(10) == 45
  find_fibonacci_index_by_length(100) == 476
  find_fibonacci_index_by_length(1000) == 4782
  find_fibonacci_index_by_length(10000) == 47847
alg:
- algorithm to make an array populated by fib numbers
  - use arg to check length of each char iterated over, keep building if
    length does not match
  - if it does, return the index of the match
=end
