# palindrome_products.rb
class Palindromes
  attr_reader :max_factor, :min_factor, :products

  def initialize(values)
    @max = values[:max_factor]
    @min = values[:min_factor] || 1
    @products = Hash.new { |hsh, v| hsh[v] = [] }
  end

  def generate
    range = (@min..@max).to_a
    range.product(range).each do |x, y|
      @products[x * y] << [x, y] if palindrome?(x * y) &&
      @products[x * y].include?([x, y].sort) == false
    end
  end

  def palindrome?(value)
    value.to_s == value.to_s.reverse
  end

  def get_largest_value
    @products.keys.max
  end

  def get_smallest_value
    @products.keys.min
  end

  def largest
    Struct.new(:value, :factors).new(get_largest_value, @products[get_largest_value])
  end

  def smallest
    Struct.new(:value, :factors).new(get_smallest_value, @products[get_smallest_value])
  end

  def value
    self.value
  end

  def factors
    self.factors
  end
end
