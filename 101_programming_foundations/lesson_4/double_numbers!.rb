# double_numbers!.rb
def double_numbers!(numbers_array)
  counter = 0

  loop do
    break if counter >= numbers_array.size

    n = numbers_array.pop
    numbers_array.unshift n * 2

    counter += 1
  end

  numbers_array
end

my_numbers = [1, 4, 3, 7, 2, 6]

p double_numbers!(my_numbers)
p my_numbers
