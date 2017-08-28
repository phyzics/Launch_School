# easy_309.rb - Palindromic Strings (Part 2)
ALPHABETIC_CHARACTERS = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
NUMERIC_CHARACTERS = '0123456789'

def real_palindrome?(str)
  str_array = str.chars.select do |char|
    ALPHABETIC_CHARACTERS.include?(char) || NUMERIC_CHARACTERS.include?(char)
  end
  str = str_array.join.downcase
  str == str.reverse
end

puts real_palindrome?('madam') #== true
puts real_palindrome?('Madam') #== true           # (case does not matter)
puts real_palindrome?("Madam, I'm Adam") #== true # (only alphanumerics matter)
puts real_palindrome?('356653') #== true
puts real_palindrome?('356a653') #== true
puts real_palindrome?('123ab321') #== false

=begin
# how do we avoid alphanumeric characters?
alg:
- get into array using chars, select based upon alpha, evaluate with reverse

=end
