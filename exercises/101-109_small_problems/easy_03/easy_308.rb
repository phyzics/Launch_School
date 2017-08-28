# easy_308.rb - Palindromic Strings (Part 1)
def palindrome?(str)
  str == str.reverse
end

def array_palindrome?(arr)
  arr == arr.reverse
end

def palindromic?(obj)
  obj == obj.reverse
end

puts palindrome?('madam') #== true
puts palindrome?('Madam') #== false          # (case matters)
puts palindrome?("madam i'm adam") #== false # (all characters matter)
puts palindrome?('356653') #== true
puts palindromic?('madam')
puts palindromic?([5, 3, 1, 3, 5])
puts array_palindrome?(['hello', 'no', 'hello'])

=begin
utp:
- take a string and return boolean based upon being a palindrome
data:
- i: string
- o: boolean
ec:
- case matters
- all characters matter
tc:
  palindrome?('madam') == true
  palindrome?('Madam') == false          # (case matters)
  palindrome?("madam i'm adam") == false # (all characters matter)
  palindrome?('356653') == true
alg:
- string == string.reverse
=end
