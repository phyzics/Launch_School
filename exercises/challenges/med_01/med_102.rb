# med_102.rb - Luhn Algorithm
class Luhn
  attr_reader :number

  def self.create(number)
    self.new(number).create
  end

  def initialize(number)
    @number = number
  end

  def addends
    @number.digits.map.with_index do |n, i|
      if i.odd? && n * 2 > 10
        n * 2 - 9
      elsif i.odd?
        n * 2
      else
        n
      end
    end.reverse
  end

  def checksum
    addends.reduce(:+)
  end

  def valid?
    checksum % 10 == 0
  end

  def create
    @original = number
    increment = 0
    loop do
      @number = @original
      @number = number.to_s.chars.push("#{increment}").join.to_i
      break if valid?
      increment += 1
    end
    @number
  end
end
