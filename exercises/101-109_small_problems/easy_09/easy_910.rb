# easy_910.rb - Grocery List
def buy_fruit(list)
  list.map { |sub_list| Array.new(sub_list[1], sub_list[0]) }.flatten
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) #==
  #["apples", "apples", "apples", "orange", "bananas","bananas"]

=begin
utp:
- takes arr w/ int, return arr with each fruit * int
data:
- i: array with strings and integers
- o: flat array with strings
alg:
- call map, change array elements to str * int, flatten the return

=end
