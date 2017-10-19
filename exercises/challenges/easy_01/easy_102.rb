# easy_102.rb
class Sieve
  attr_reader :limit, :range_arr

  def initialize(limit)
    @limit = limit
    @range_arr = (2..limit).to_a
  end

  def primes
    multiples_arr = []
    range_arr.each do |num|
      next if multiples_arr.include?(num)
      range_arr.each do |n|
        next if num == n || multiples_arr.include?(n)
        multiples_arr << n if n % num == 0
      end
    end
    range_arr - multiples_arr
  end
end
=begin
alg:
- how do we "mark" the composite numbers?
  - set up a multiples array
  - iterate with each over an array
    - push all multiples in the array of e into the multiples array (double it)
  - subtract the multiples array from the range_arr


=end
