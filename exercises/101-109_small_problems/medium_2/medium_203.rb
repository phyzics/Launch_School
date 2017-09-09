# medium_203.rb - Lettercase Percentage Ratio
def letter_arrays(str)
  lowercase = ''
  uppercase = ''
  neither = ''
  str.each_char do |char|
    if (char =~ /[a-z]/i) == nil
      neither << char
    elsif char == char.downcase
      lowercase << char
    else
      uppercase << char
    end
  end
  [lowercase, uppercase, neither]
end

def letter_percentages(str)
  lower_str, upper_str, neither_str = letter_arrays(str)
  total_size = (lower_str.size + upper_str.size + neither_str.size).to_f

  {
    lowercase: ((lower_str.size)   / total_size) * 100,
    uppercase: ((upper_str.size)   / total_size) * 100,
    neither:   ((neither_str.size) / total_size) * 100,
  }

end

p letter_percentages('abCdef 123')
p letter_percentages('AbCd +Ef')
p letter_percentages('123')

=begin
utp:
- take a string, return hash with 3 values
  - percentage of lowercase, of uppercase, and neither
data:
- i: string
- o: hash with float
tc:
  letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
  letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
  letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
alg:
- push chars depending on criteria into one of 3 arrays
- total = length of all summed together
- get percentages
- return hash
=end
