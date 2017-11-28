# easy_803.rb - Leading Substrings
def substrings_at_start(str)
  return_arr = []
  str.chars.each_with_index { |_, idx| return_arr << str[0..idx] }
  return_arr#.sort { |a, b| a.length <=> b.length }
end

p substrings_at_start('abc')
p substrings_at_start('xyzzy')

=begin
utp:
- return list of substrings, the first char always being first char of original
  string
- sort shortest to longest
data:
- i: string
- o: array
tc:
  substrings_at_start('abc')
  substrings_at_start('a')
  substrings_at_start('xyzzy')
alg:
- have an empty array, iterate w/ e_w_i, returning the string 0-idx into the
  array
- sort with a block specifying a.length <=> b.length and return
  - this isn't necessary with our building process

=end
