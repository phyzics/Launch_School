# palindrome_products.rb
class Palindromes
  attr_accessor :max_factor, :min_factor

  def initialize(values)
    @max = values[:max_factor]
    @min = values[:min_factor] || 1
  end

  def generate
    range = (@min..@max).to_a
    products = range.product(range)
    @matches = products.select do |arr|
      num = arr.reduce(:*).to_s
      num == num.reverse
    end
    @matches.map!(&:sort!).uniq!
  end

  def largest
    largest_value = @matches.max_by { |arr| arr.reduce(:*) }.reduce(:*)
    @matches.select { |arr| arr.reduce(:*) == largest_value }
  end

  def smallest
    smallest_value = @matches.min_by { |arr| arr.reduce(:*) }.reduce(:*)
    @matches.select { |arr| arr.reduce(:*) == smallest_value }
  end
end

class Array
  def value
    self[0].class == Integer ? self.reduce(:*) : self[0].reduce(:*)
  end

  def factors
    self[0].class == Integer ? [self] : self
  end
end
