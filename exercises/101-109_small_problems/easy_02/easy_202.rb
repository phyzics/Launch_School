#easy_202.rb - How big is the room?
SQFEET_TO_SQINCHES = 144
SQINCHES_TO_SQCENTIMETERS = 6.4516

def prompt(msg)
  puts "=> #{msg}"
end

prompt('Enter the length of the room in feet:')
length = gets.chomp
prompt('Enter the width of the room in feet:')
width = gets.chomp

sq_ft = (length.to_f * width.to_f).round(2)
sq_in = (sq_ft * SQFEET_TO_SQINCHES)
sq_cm = (sq_in * SQINCHES_TO_SQCENTIMETERS).round(2)

prompt("The area of the room is #{sq_ft} square feet" + \
       " (#{sq_in} square inches, or #{sq_cm} square centimeters).")

# original program
=begin
puts 'Enter the length of the room in meters:'
length = gets.chomp
puts 'Enter the width of the room in meters:'
width = gets.chomp
sq_mtrs = length.to_f * width.to_f
sq_ft = sq_mtrs * 10.7639
puts "The area of the room is #{sq_mtrs} square meters (#{sq_ft} square feet)."


utp:
- ask for length and width of room in meters
- output area in square meters and square feet
  - 1 sq meter == 10.7639 sq ft
  - do so in float form
- do not worry about validating input

data:
- i: integer or float
- o: float

test cases
- w 10 l 7
- w 9.65 l 10.85

algorithm:
- request width and length and set corresponding variables to input. Convert
  these to floats and multiply for square meter. * again for sq ft.

=end
