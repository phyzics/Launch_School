# practice03.rb
[1, 2, 3].reject do |num|
  puts num
end

# => When #reject is given a block argument, it returns a new array with elements
# => that evaluated to 'false'. Since #puts is used in the last line of the
# => block, it will always return 'nil', and so #reject should return
# => [1, 2, 3]
