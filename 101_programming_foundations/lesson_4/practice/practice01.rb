# practice01.rb
x = [1, 2, 3].select do |num|
  num > 5
  'hi'
end

p x
# => guess: ['hi', 'hi', 'hi'] since 'hi' is the last value in the block and
# => is truthy

# => incorrect: the code in the block isn't given to the return but evaluates
# => whether or not the element is returned. So since 'hi' is truthy, all 3
# => elements are evaluated to 'true', thus it returns [1, 2, 3]
