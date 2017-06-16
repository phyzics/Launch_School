# practice10.rb
[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

# => Each element is iterated over; 1 is not > 1 and so 1 is returned. 2 and 3
# => are both greater than 1, and so 'nil' is returned from the Kernel#puts.
# => Array#map should return [1, nil, nil]
