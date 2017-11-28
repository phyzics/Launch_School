# med_105.rb - Passing Parameters Part 3

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*x, y|
  puts x.join(', ')
  puts y
end

puts

gather(items) do |x, *y, z|
  puts x
  puts y.join(', ')
  puts z
end

puts

gather(items) do |x, *y|
  puts x
  puts y.join(', ')
end

puts

gather(items) do |a, b, c, d|
  puts "#{a}, #{b}, #{c}, and #{d}"
end
