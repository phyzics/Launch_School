# easy_807.rb - Double Char (Part 1)
def repeater(str)
  arr = []
  str.chars.each { |char| arr << char << char }
  arr.join
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''

=begin
utp:
- takes string, returns new string with every count doubled
- empty string returns empty string
data:
- i/o: string
tc:
  repeater('Hello') == "HHeelllloo"
  repeater("Good job!") == "GGoooodd  jjoobb!!"
  repeater('') == ''
alg:
- use a placeholder array, call chars on str, shove two copies in, use join
=end
