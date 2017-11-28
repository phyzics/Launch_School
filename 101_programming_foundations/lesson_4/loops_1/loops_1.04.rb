# loops_1.04.rb
loop do
  puts 'Should I stop looping?'
  answer = gets.chomp
  break if answer == 'yes'
  puts "Please enter 'yes' to break."
end
