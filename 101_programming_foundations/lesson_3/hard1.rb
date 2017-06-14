# hard1.rb

# 1
# => I was right in that the conditional would be "true" and that "greeting" would not
# => be set to "hello world", but I did not know it would come out as "nil"

# 2
# => greetings == { a: 'hi there'}

# 3
=begin
A)
  one is: one
  two is: two
  three is: three

B)
  one is: one
  two is: two
  three is: three

C)
  one is: two
  two is: three
  three is: one
=end

# 4
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false if dot_separated_words.size != 4
  dot_separated_words.all? { |number| is_an_ip_number?(number) }
end
