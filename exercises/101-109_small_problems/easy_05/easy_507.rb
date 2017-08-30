# easy_507.rb - Letter Counter (Part 2)
def word_sizes(str)
  arr = str.split.map { |word| word.gsub(/[^a-z]/i, '') }
  arr.each_with_object({}) do |word, hsh|
    hsh[word.size] = arr.count{ |ele| ele.size == word.size }
  end
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}
