# easy_505.rb - Clean up the words
ALPHA_NUMERIC_CHARS = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ01234
                      5678910'

def replace_non_AN_chars(str)
  str_arr = str.chars.map do |char|
    if ALPHA_NUMERIC_CHARS.include?(char) == false
      ' '
    else
      char
    end
  end
  str_arr
end

def cleanup(str)
  str_arr = replace_non_AN_chars(str)
  whitespace_counter = 0
  return_str = ''

  str_arr.each do |char|
    if char != ' '
      return_str << char
      whitespace_counter = 0
    elsif char == ' ' && whitespace_counter < 1
      return_str << char
      whitespace_counter += 1
    else
      next
    end
  end
  return_str
end

p cleanup('-5^&hey;man23--9*')
p cleanup("---what's my +*& line?") == ' what s my line '
=begin
utp:
- take a string, remove non-alphanumeric from str, replaced with ' '
  - however, multiple non AN only replaced by one ' ', not multiple
data:
- i/o: string
tc:
  p cleanup("---what's my +*& line?") == ' what s my line '
alg
- set up constants for AN
- iterate and replace each non AN with space
- split based upon AN, then uniq, then join
=end
