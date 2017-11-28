# easy_804.rb - All Substrings
def substrings_at_start(str)
  return_arr = []
  str.chars.each_with_index { |_, idx| return_arr << str[0..idx] }
  return_arr#.sort { |a, b| a.length <=> b.length }
end

def substrings(str)
  return_arr = []
  str.chars.each_with_index do |_, idx|
    return_arr << substrings_at_start(str[idx..(str.size - 1)])
  end
  return_arr.flatten
end

p substrings('abcde')

=begin
utp:
- take string, return arr of all Substrings
  - order be all 0 starting first, then all 1, etc, organized in greater length
  - use previous method
data:
- i: string
- o: array of strings
tc:
  p substrings('abcde') == [
    'a', 'ab', 'abc', 'abcd', 'abcde',
    'b', 'bc', 'bcd', 'bcde',
    'c', 'cd', 'cde',
    'd', 'de',
    'e'
  ]
alg:
- use an iterative method to keep calling substrings_at_start, but passing
  through an index greater by 1 until there are no more elements
- keep punching these reults into a return array, and then flatten

=end
