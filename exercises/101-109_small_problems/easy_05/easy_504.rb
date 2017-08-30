# easy_504.rb - Letter Swap
def swap(str)
  str_arr = str.split.map do |word|
    first_and_last = []
    word = word.chars
    first_and_last << word.first << word.last
    word[0] = first_and_last.last
    word[word.size - 1] = first_and_last.first
    word.join
  end
  str_arr.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'

=begin
utp:
- take a string, return with 1st and last reversed
 - assume nothing but letters, and always has at least one letter
data:
- i/o: strings
tc:
  p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
  p swap('Abcde') == 'ebcdA'
  p swap('a') == 'a'
alg:
- split on whitespace to get into an array
- iterate over reach and call chars, then call map
  - << first and last into an array, then reassign after iteration



- join with (' ')
=end
