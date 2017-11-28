# easy_110.rb - Roman Numerals
class Integer
  ROMAN_NUMERALS = {
    4    => 'IV',
    5    => 'V',
    9    => 'IX',
    40   => 'XL',
    50   => 'L',
    90   => 'XC',
    400  => 'CD',
    500  => 'D',
    900  => 'CM'
  }
  def to_roman
    str = ''
    num = self
    (self.to_s.size - 1).downto(0) do |n|
      a, num = num.divmod(10**n)

      case n
      when 0 then base_numeral = 'I'
      when 1 then base_numeral = 'X'
      when 2 then base_numeral = 'C'
      when 3 then base_numeral = 'M'
      end

      if a == 4 || a == 9
        str << ROMAN_NUMERALS[a * 10**n]
      elsif a > 4
        str << ROMAN_NUMERALS[5 * 10**n] + (base_numeral * (a - 5))
      else
        str << base_numeral * a
      end
    end

    str
  end
end
