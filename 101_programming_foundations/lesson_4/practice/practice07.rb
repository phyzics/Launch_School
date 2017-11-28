# practice07.rb
[1, 2, 3].any? do |num|
  puts num
  num.odd?
end
# => The block should return true since num.odd? is the last evaluation and
# => both 1 and 3 evaulate to true. The method will thus return 'true' since it
# => is boolean.
