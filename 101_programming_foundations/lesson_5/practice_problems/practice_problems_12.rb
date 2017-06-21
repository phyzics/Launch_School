# practice_problem_12.rb
arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

new_hsh = arr.each_with_object({}) do |(k, v), hsh|
  hsh[k] = v
end

p new_hsh
