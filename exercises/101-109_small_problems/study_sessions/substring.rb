require'pry'
def substrings(word)
  str_arr = word.chars
  return_arr = []
  starting_num = 0
  word.size.times do
    str_arr.each_with_index { |_, i| return_arr << str_arr[starting_num..i] }
    starting_num += 1
  end
  return_arr.map {|arr| arr.join}.select {|str| str.size > 1}
  #binding.pry
end

p substrings("band")
p substrings("world")
p substrings("ppop")
