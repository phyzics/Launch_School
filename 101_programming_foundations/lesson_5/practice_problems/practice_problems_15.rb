# practice_problem_15.rb
arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

arr2 = arr.reject do |hsh|
  hsh.any? do |k, v|
    v.any? { |num| num.odd? }
  end
end

p arr2
