# medium_107 - Word to Digit
WORD_DIGIT_KEY = {
  'zero' => '0',
  'one' => '1',
  'two' => '2',
  'three' => '3',
  'four' => '4',
  'five' => '5',
  'six' => '6',
  'seven' => '7',
  'eight' => '8',
  'nine' => '9'
}

def word_to_digit(str)
  str_arr = str.split
  return_arr = str_arr.map do |char|
    if WORD_DIGIT_KEY.keys.include?(char)
      WORD_DIGIT_KEY[char]
    elsif char.include?('.')
      punctuation = char.slice!(-1)
      char = WORD_DIGIT_KEY[char] if WORD_DIGIT_KEY.keys.include?(char)
      char = char + punctuation
    else
      char
    end
  end
  return_arr.join(' ')
end

p word_to_digit('Please call me at five five five one two three four. Thanks.')

=begin
- take string with words 0-9 and return digits
alg:
- create a hash, map and replace if value is a key, then join
- non whitespace interference
  -

=end
