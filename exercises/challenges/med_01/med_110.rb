# med_110.rb - Nth Prime
require 'prime'
class Prime

  def self.nth(idx)
    raise ArgumentError if idx < 1
    prime_array = [2]
    n = 3
    loop do
      break if prime_array.size == idx
      prime_array << n if is_prime?(n)
      n += 2
    end

    prime_array.last
  end

  private

  def self.is_prime?(number)
    limit = Math.sqrt(number)
    (2..limit).each do |f|
      return false if number % f == 0
    end
    true
  end
end
