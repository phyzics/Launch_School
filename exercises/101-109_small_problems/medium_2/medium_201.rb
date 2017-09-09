# medium_201.rb - Longest Sentence
require 'yaml'
text = File.read("four_score.yml")

text_array = []
build_string = ''

text.each_char do |char|

  if char == '.' || char == '!' || char == '?'
    build_string << char
    text_array << build_string
    build_string = ''
  else
    build_string << char
  end
end

text_array.map! { |sentence| sentence.split(' ') }
text_array.sort_by! {|arr| arr.length}.reverse!

longest_count = text_array.first.length

text_array.map! { |sentence| sentence.join(' ') }

puts ">>The longest sentence, which is #{longest_count} words long, is:"
puts ">>'#{text_array.first}'."
=begin
utp:
- reads content of text file, print longest sentence based on word count
- sentences end with ., !, or ?
- word = sequence of char (not ' ' or endings)
- print both the sentence and number of words
alg:
- first split all the sentences into arrays
- split sentences into words in the sentence
  - .map.split(' ')
- sort the array b<=>a
- first call join



=end
