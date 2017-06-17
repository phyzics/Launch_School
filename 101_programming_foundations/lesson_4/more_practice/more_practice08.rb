# more_practice08.rb

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

# => For each iteration it would print the number and then return the number
# => after #shift has been performed. Since shift starts from the beginning
# => of the array, each printed number is the one that is 'shifted' after

# => Incorrect: the index iterates regardless, so for the second pass it uses
# => the index '1', which would be '3'. 2 is returned in the shift, and since
# => the index '2' of [3, 4] is nil, nothing is returned and it ends

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

# => Each iteration would print the current element and then return the last
# => element in the array as it is 'popped out'. Thus:
=begin
1
4 <-- return
2
3 <-- return
=end
# => unlike the first example, the array would still contain [1, 2]

# => Correct!
