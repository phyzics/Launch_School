# loops_2.02.rb
loop do
  number = rand(100)
  break if (0..10).include?(number)
  puts number
end
