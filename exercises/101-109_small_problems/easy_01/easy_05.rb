# easy_05.rb

def reverse_sentence(string)
  string.split.reverse.join(' ')
end

=begin
utp
- takes a string and returns it in reverse order
- need to account for an empty string

i/o/d
- i: string
- o: string
- d: string, largely

test cases:
puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'

algorithim
- split string into array, reverse array, join string back together with ' ' as
  separator


=end
