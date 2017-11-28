# easy_702.rb - Lettercase Counter
def letter_case_count(str)
  lowercase_count = str.count('a-z')
  uppercase_count = str.count('A-Z')
  neither_count = (str.size) - lowercase_count - uppercase_count
  {
    lowercase: lowercase_count,
    uppercase: uppercase_count,
    neither: neither_count
  }
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
=begin
utp:
- takes string, counts upper, lower, and neither, and returns a hash w/ key as
  type and value as the count
- blank spaces are "neither"
data:
- i: str
- o: hash
tc:
  letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
  letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
  letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
  letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
alg:
- use #include? and check for a range of lower, and upper, saving the count
  as a variable
- neither = str.size - ucount - lcount

=end
