# easy_509.rb - ddaaiillyy ddoouubbllee
require 'pry'

def crunch(str)
  str_arr = str.chars
  return_str = ''

  str_arr.each_with_index do |char, index|
    if index == 0
      return_str << char
    elsif char == str_arr[index - 1]
      next
    else
      return_str << char
    end
    #binding.pry
  end
  return_str
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''
=begin
utp:
- take string, return string with all consecutive collapsed
- cannot use #squeeze or #squeeze!
data:
- i/o: string
tc:
  p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
  p crunch('4444abcabccba') == '4abcabcba'
  p crunch('ggggggggggggggg') == 'g'
  p crunch('a') == 'a'
  p crunch('') == ''
alg:
- set up a identical counter, every time it reaches two it starts to not select,
  and it resets when it reaches a new char
    - set up empty string for return and one for verification
      - save each member to verify and make sure it doesn't duplicate with the
        next
=end
