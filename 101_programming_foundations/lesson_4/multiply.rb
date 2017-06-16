# multiply.rb
def multiply(numbers_array, multiplier)
  multiplied_numbers = []
  counter = 0

  loop do
    break if counter >= numbers_array.size

    current_number = numbers_array[counter]
    multiplied_numbers << current_number * multiplier

    counter += 1
  end

  multiplied_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]


puts "Pick an integer"
input = gets.chomp.to_i

p multiply(my_numbers, input)
p my_numbers
