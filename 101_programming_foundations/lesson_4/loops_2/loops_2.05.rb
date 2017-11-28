# loops_2.05.rb
numbers = []

until numbers.size >= 5
  puts 'Enter any number:'
  input = gets.chomp.to_i
  numbers << input
end
puts numbers
