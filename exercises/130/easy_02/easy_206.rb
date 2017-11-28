# easy_206.rb - each_with_index
def each_with_index(array)
  index = 0
  until index >= array.size do
    yield(array[index], index)
    index += 1
  end
  array
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]
