# easy_102.rb
class Sieve
  attr_reader :range_arr

  def initialize(limit)
    @range_arr = (2..limit).to_a
  end

  def primes
    range_arr.each do |num|
      range_arr.reject! { |n| n % num == 0 && n != num }
    end
  end
end
