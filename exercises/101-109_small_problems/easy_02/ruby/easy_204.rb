# easy_204.rb - When will I Retire?
CURRENT_YEAR = 2017

p 'What is your age? '
current_age = gets.chomp.to_i
p 'At what age would you like to retire? '
retirement_age = gets.chomp.to_i
puts ''
years_left = retirement_age - current_age

puts "It's #{CURRENT_YEAR}. You will retire in #{CURRENT_YEAR + years_left}."
puts "You only have #{years_left} years of work to go!"

=begin
utp:
- get 2 age variables
- display current year, then year of retirement
- show how many more years that is

edge cases:
- floats, 0, full years or part years?
- display months, days?
- starting year?

data:
- i: integer
- o: string
- d: integers and strings

test cases:
- a: 30, ra: 70
- a: 28, ra: 65

algorithm:
- take age and desired age; get years of work left; display current year then
  display year of retirement (current year + years left), then d years left

=end
