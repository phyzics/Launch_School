# easy_401.rb - Short Long Short
def short_long_short(str1, str2)
  arr = [str1, str2].sort_by { |word| word.length }
  "#{arr[0]}#{arr[1]}#{arr[0]}"
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"
=begin
utp:
- 2 str args, determine longest, then new str (short + long + short)
- assume diff lengths
data:
- i: string
- o: string
ec:
- validate if string
tc:
  short_long_short('abc', 'defgh') == "abcdefghabc"
  short_long_short('abcde', 'fgh') == "fghabcdefgh"
  short_long_short('', 'xyz') == "xyz"
alg:
- determine length with #length, save to separate values, concatenate
- compare within array and build from there
=end
