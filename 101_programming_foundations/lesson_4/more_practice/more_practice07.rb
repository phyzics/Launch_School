# more_practice07.rb
statement = "The Flintstones Rock"
statement = statement.delete(" ")
frequency_array = statement.split(//)

frequency_hash = frequency_array.each_with_object({}) do |letter, hash|
  if hash.key?(letter)
    hash[letter] += 1
  else
    hash[letter] = 1
  end
end

p frequency_hash
