# easy_710.rb - the End is Near But Not Here
def penultimate(str)
  str.split[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'

=begin
utp:
- returns the next to last word in a string
  - words = sequence of non blank chars
  - str always has 2 words
data:
- i/o: string
tc:
p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'
alg:
- split the string on whitespace, return arr[-2]
=end
