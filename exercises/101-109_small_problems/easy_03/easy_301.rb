# easy_301.rb
def number_validator(num)
  return :integer if num.to_i.to_s == num
  return :float if num.to_f.to_s == num
end

def prompt(msg)
  puts "==> #{msg}"
end

def input_number
  prompt("Enter the #{ROUNDS[$current_round]} number:")
  number = ''
  loop do
    number = gets.chomp
    case number_validator(number)
    when :integer
      number = number.to_i
      break
    when :float
      number = number.to_f
      break
    end
    prompt("Please enter a valid number!")
  end
  number
end

ROUNDS = %w(1st 2nd 3rd 4th 5th last)
$current_round = 0
final_array = []

5.times do
  final_array << input_number
  $current_round += 1
end

last_number = input_number

if final_array.include?(last_number)
  prompt("The number #{last_number} appears in #{final_array}.")
else
  prompt("The number #{last_number} does not appear in #{final_array}.")
end



=begin
utp:
- take 6 numbers, see if the 6th is amongst the first 5
edge:
- input validation
- i, f, neg, and 0 all fair game? let's assume yes
data:
- i: strings
- o: string made of array
- likely use array, string, and Int class
test cases
- examples on the screen
algorithm:
- ask user for input, convert to i or f, and shovel into array
- for last; convert to appropriate number and then use include?

=end
