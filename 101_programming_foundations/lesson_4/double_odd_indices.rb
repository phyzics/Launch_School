# double_odd_indices.rb
def double_odd_indices(numbers)
  doubled_odd_indices = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    current_number *= 2 if counter.odd?
    doubled_odd_indices << current_number

    counter += 1
  end

  doubled_odd_indices
end

my_numbers = [1, 4, 3, 7, 2, 6]

p double_odd_indices(my_numbers)
