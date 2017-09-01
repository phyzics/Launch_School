# easy_602.rb - Delete vowels
VOWELS = 'aeiouAEIOU'

def remove_vowels(str_arr)
  return_arr = str_arr.map(&:chars)
  return_arr.map { |arr| arr.select { |char| VOWELS.include?(char) == false }.join }
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
=begin
utp:
- take array of strings, return array with same values but w/o vowels
data:
- i: array of strings
- o: array of strings
tc:
  remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
  remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
  remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
alg:
- splice up string via #chars, use #select, choose only non vowel elements,
  join new array
=end
