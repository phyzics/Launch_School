# easy_203.rb - Tip calculator

puts 'What is the bill?'
bill = gets.chomp.to_f
puts 'What is the tip percentage?'
tip_percentage = gets.chomp.to_f

tip   = (bill * (tip_percentage / 100.0))
total = (bill + tip)

puts ''
puts "The tip is $#{format('%.2f', tip)}"
puts "The total is $#{format('%.2f', total)}"

=begin
utp:
- ask for bill amount and tip rate
- calculate tip first, then display both tip and total

- display only one 0 if no cents, or 2? Example shows one

data:
- i: integer or float
- o: string
- d: int/float and strings

test cases:
- b: 200, t: 15
- b: 56, t: 17.5

algorithm:
- ask for bill and tip and capture them as separate variables. convert to
  floats, convert tip percentage to decimal, calculate tip,
  then calculate total and output to user

=end
