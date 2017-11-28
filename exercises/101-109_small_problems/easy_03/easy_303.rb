# easy_303 - Counting the Number of Characters
def count_characters(str)
  total_count = str.length
  total_count -= str.count(" ")

  puts "There are #{total_count} characters in \"#{str}\"."
end

puts "Please write word or multiple words:"
input = ''
loop do
  input = gets.chomp
  break if input.length - input.count(" ") > 0
  puts "You must enter a word or multiple words!"
end
count_characters(input)
=begin
utp:
- take input, return number of chars (spaces not included)
ec:
- empty strings
data:
- i: str
- o: str
tc
- "walk"
- "walk, don't run"
alg:
- input, count all charcters - count of " ", return w/ org str

=end
