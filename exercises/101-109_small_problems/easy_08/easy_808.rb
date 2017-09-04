# easy_808.rb - Double Char (Part 2)
CONSONANTS = 'bcdfghjklmnpqrstvwxyz'

def double_consonants(str)
  return_str = ''
  str.each_char do |char|
    if CONSONANTS.include?(char) || CONSONANTS.upcase.include?(char)
      arr << char << char
    else
      arr << char
    end
  end
  return_str
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""
