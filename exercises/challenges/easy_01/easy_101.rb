# easy_101.rb - Series
class Series
  attr_reader :number

  def initialize(n)
    @number = n.chars.map(&:to_i)
  end

  def slices(n)
    raise ArgumentError if n > number.size

    slices_array = []
    number.each_with_index do |_, i|
      slices_array << number[i, n] if number[i, n].size == n
    end
    slices_array
  end
end
