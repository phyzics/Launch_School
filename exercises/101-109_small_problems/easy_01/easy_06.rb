# easy_06.rb - Reverse It (Part 2)

def reverse_words(string)
  arr = string.split
  arr.each { |sub_string| sub_string.reverse! if sub_string.length >= 5 }
  arr.join(' ')
end

=begin
utp
- take a string of 1 or more words
- reverse words whose length => 5 characters
- return the string with spaces only if more than one word present

i/o/d
- i: string
- o: string
- d: array

test cases:
puts reverse_words('Professional')
puts reverse_words('Walk around the block')
puts reverse_words('Launch School')

algorithm
- split string and iterate over each word; if word =>5 then reverse it, then
  join array as string with ' ' as delimiter

=end
