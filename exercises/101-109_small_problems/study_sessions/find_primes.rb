# find_primes.rb
def find_primes(start, finish)
  primes_arr = (start..finish).select do |num|
    if num == 2 || num == 3
      true
    elsif num.even?
      false
    elsif num % 3 == 0
      false
    else
      true
    end
  end
  primes_arr.join(", ")
end

puts find_primes(3, 18) # => 3, 5, 7, 11, 13, 17
puts find_primes(5, 28) # => 5, 7, 11, 13, 17, 19, 23
puts find_primes(1, 2) # => 1, 2
=begin
utp:
- take 2 numbers, and return all primes between, inclusive
data:
- i: ints
- o: str
- int, str, arr
tc:
- 3, 18/ 5, 28
alg:
- iterate through range of start..end; num %2 == 0 (next), % 3 (exp3) == 0 (next)
- primes << arr, join arr
=end
