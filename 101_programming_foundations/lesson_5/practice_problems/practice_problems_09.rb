# practice_problem_09.rb
arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

arr_2 = arr.map do |collection|
  puts collection
  collection.sort { |a, b| b <=> a }
end

p arr_2
