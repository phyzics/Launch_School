# medium_202.rb - Now I Know My ABCs
BLOCK_PAIRS = {
  'a' => 'n',
  'b' => 'o',
  'c' => 'p',
  'd' => 'q',
  'e' => 'r',
  'f' => 's',
  'g' => 't',
  'h' => 'u',
  'i' => 'v',
  'j' => 'w',
  'k' => 'x',
  'l' => 'y',
  'm' => 'z',
  'n' => 'a',
  'o' => 'b',
  'p' => 'c',
  'q' => 'd',
  'r' => 'e',
  's' => 'f',
  't' => 'g',
  'u' => 'h',
  'v' => 'i',
  'w' => 'j',
  'x' => 'k',
  'y' => 'l',
  'z' => 'm'
}

def block_word?(string)
  str = string.downcase
  return false if str != str.chars.uniq.join
  str.each_char do |char|
    if str.include?(char) && str.include?(BLOCK_PAIRS[char])
      return false
    end
  end
  true
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true

=begin
utp:
- series of blocks, each block can only be used once, if one side of the block
  is used, then the other cannot
- take a string, return whether blocks can spell it or not
ec:
- everything downcase?
- validation?
data:
- i: string
- o: boolean
tc:
  p block_word?('BATCH') == true
  p block_word?('BUTCH') == false
  p block_word?('jest') == true
alg:
- make sure no letter is used twice
  - iterate, make sure count for each char in the word is < 2
- make sure that each block is only used once
  - hash that has word used: word excluded
=end
