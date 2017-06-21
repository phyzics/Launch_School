# practice_problem_09.rb
arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

arr2 = arr.map do |hash|
  hash.each_with_object({}) do |(k, v), newhash|
    newhash[k] = v + 1
  end
end

p arr2
p arr
