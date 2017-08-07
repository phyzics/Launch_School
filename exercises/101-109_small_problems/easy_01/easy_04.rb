# easy_04.rb

def count_occurrences(arr)
  total = arr.each_with_object ({}) { |ele, hsh| hsh[ele] = arr.count(ele) }
  total.each { |k,v| puts "#{k} => #{v}" }
end

vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle',
            'motorcycle', 'car', 'truck']

count_occurrences(vehicles)

=begin
utp
- count occurences of word and print number of times

i/o
- i: array with strings
  - what if the element is something else? assume only strings
- o: string
- dt: hash -- this allows me to make a lookup table that I can then print the
      k,v pairs of

test cases:
count_occurrences(vehicles)

algorithm
- iterate through the collection, use #count to determine value, elment to
  determine key

abstract
- count number of occurences
  - needs to be put into a hash at the end using element as key and occurences
    as the value
- printing the values
  - save return as a value, then use #each to print out k-v pairs


=end
