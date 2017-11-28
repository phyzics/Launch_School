# easy_810.rb - Get The Middle Character
def center_of(str)
  str.size.even? ? str[(str.size / 2) - 1, 2] : str[str.size / 2]
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'

=begin
utp:
- takes non-empty string, returns middle char or chars
data:
- i/o: string
tc:
  center_of('I love ruby') == 'e'
  center_of('Launch School') == ' '
  center_of('Launch') == 'un'
  center_of('Launchschool') == 'hs'
  center_of('x') == 'x'
alg:
- slice by size/2..2 if even, size/2..1 if odd

=end
