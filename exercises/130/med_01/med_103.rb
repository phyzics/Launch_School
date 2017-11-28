# med_103.rb - Passing Parameters Part 1
items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "Let's start gathering food."
end
