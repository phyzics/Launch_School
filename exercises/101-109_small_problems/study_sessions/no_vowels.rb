# no_vowels.rb
def no_vowels(arr)
  arr.map { |word| word.delete('aeiouAEIOU') }.join(", ")
end

str_arr = %w(green yellow black white)
str_arr2 = %w(Green Yellow black white)

puts no_vowels(str_arr)
puts no_vowels(str_arr2)

=begin
utp:
- take an array of str, and return arr of str w/o vowels

ec:
- capitals?
- new array, or modify?

data
- array w/ strings

tc:
- 'green, yellow, black, white' => 'grn, yllw, blck, wht'
- 'Green, Yellow, black, white' => 'Grn, Yllw, blk, wht'

alg:
- take the array, transform with map, use delete to remove vowels

=end
