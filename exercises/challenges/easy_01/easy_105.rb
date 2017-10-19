# easy_105.rb - Sum of Multiples
class SumOfMultiples
  attr_reader :multiples

  def self.to(number)
    self.new(3, 5).to(number)
  end

  def initialize(*multiples)
    @multiples = multiples
  end

  def to(number)
    return 0 if number < 4
    range = (2...number).to_a
    all_multiples = []

    range.each do |potential|
      multiples.each do |m|
        next if all_multiples.include?(potential)
        all_multiples << potential if potential % m == 0
      end
    end
    all_multiples.reduce(:+)
  end
end
