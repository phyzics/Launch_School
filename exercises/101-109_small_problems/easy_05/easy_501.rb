# easy_501.rb - ASCII String Value
def ascii_value(str)
  return 0 if str.empty?
  str.chars.map { |char| char.ord }.reduce(:+)
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

=begin
utp:
- determine total ASCII value of all chars within a String, and return said val
data:
- i: str
- o: int
ec:
- validation
tc:
  ascii_value('Four score') == 984
  ascii_value('Launch School') == 1251
  ascii_value('a') == 97
  ascii_value('') == 0
alg:
- #chars, iterate with map, calling #ord on each char, then reduce :+

=end
