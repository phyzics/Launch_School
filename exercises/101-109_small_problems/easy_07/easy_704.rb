# easy_704.rb - Swap Case
def swapcase(str)
  str_arr = str.chars.map do |char|
    char == char.capitalize ? char.downcase : char.capitalize
  end
  str_arr.join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
