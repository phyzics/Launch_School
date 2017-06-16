# practice04.rb
['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

# => #each_with_object should return: {'a' => 'ant', 'b' => 'bear, 'c' => 'cat'}
# => the #[] takes the first character of each string that is passed and assigns
# => that as a new key in the hash, the value being set to the passed through
# => string. It returns a hash since the hash is the collection object passed
# => as the method argument.
