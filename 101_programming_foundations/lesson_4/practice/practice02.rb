# practice02.rb
x = ['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

p x

# => It enumerates depending on whether each element evaluates to true or false.
# => We can check this (besides ruby-doc) by changing the integer in the
# => evaluation and seeing the return value.
