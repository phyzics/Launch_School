# easy_109.rb - Perfect Number
class PerfectNumber
  def self.classify(num)
    raise RuntimeError, "must enter a natural number" if num < 0

    sum = (1...num).to_a.select { |f| num % f == 0 }.reduce(:+)

    if num > sum
      "deficient"
    elsif num < sum
      "abundant"
    else
      "perfect"
    end
  end
end
