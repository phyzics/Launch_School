# easy_805.rb - Palindromic Substrings
def substrings_at_start(str)
  return_arr = []
  str.chars.each_with_index { |_, idx| return_arr << str[0..idx] }
  return_arr
end

def substrings(str)
  return_arr = []
  str.chars.each_with_index do |_, idx|
    return_arr << substrings_at_start(str[idx..(str.size - 1)])
  end
  return_arr.flatten
end

def palindromes(str)
  substrings(str).select { |s_str| s_str.size > 1 && s_str == s_str.reverse }
end

p palindromes('madam') == ['madam', 'ada']
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

=begin
utp:
- take string, return list of all substrings that are palindromic
  - should be arranged in same sequence as they appear
  - duplicates should be included
  - use your previous methods
  - case sensitive
  - single chars are not palindromes
data:
- i: str
- o: array of str
tc:
  palindromes('abcd') == []
  palindromes('madam') == ['madam', 'ada']
  palindromes('hello-madam-did-madam-goodbye') == [
    'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
    'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
    '-madam-', 'madam', 'ada', 'oo'
  ]
  palindromes('knitting cassettes') == [
    'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
  ]
alg:
- call select and use as criteria a.size > 1 && a == a.reverse
=end
