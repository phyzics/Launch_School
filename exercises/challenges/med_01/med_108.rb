# med_108.rb - Phone Number
class PhoneNumber
  INVALID = '0000000000'

  def initialize(unfiltered_number)
    @number = unfiltered_number
  end

  def number
    return INVALID if @number.match?(/[a-z]/i)
    num = @number.sub(/1?\(?(\d{3})\)?[ .]?(\d{3})[.-]?(\d{4})/, '\1\2\3')
    return INVALID if num.size != 10
    num
  end

  def area_code
    number.slice(0, 3)
  end

  def to_s
    number.sub(/(\d{3})(\d{3})(\d{4})/, '(\1) \2-\3')
  end
end
