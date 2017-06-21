# practice_problems_01.rb
arr = ['10', '11', '9', '7', '8']

arr.map! do |num|
  num.to_i
end

arr.sort!.reverse!

arr.map! do |num|
  num.to_s
end

p arr

# method 2
arr = ['10', '11', '9', '7', '8']

arr.sort! do |a, b|
  b.to_i <=> a.to_i
end

p arr
