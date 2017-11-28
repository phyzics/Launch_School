# easy_205.rb - Greeting a user

p 'What is your name? '
name = gets.chomp.capitalize

if name.include?('!')
  name.chop!
  puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end

=begin
utp:
- ask for name (string). If user has "!" at the end, program yells back (caps)

edge_cases:
- name validation? Yell only if ! is at the end? What of diff chars?
- capitalization if input is all lower?

data:
- i: string
- o: string
- d: string

algorithm:
- save input as variable. If "!" exists, then return screaming

further exploration:
print 'What is your name? '
name = gets
gets.chomp!

if name[-1] == '!'
  name.chop!
  puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end

=end
