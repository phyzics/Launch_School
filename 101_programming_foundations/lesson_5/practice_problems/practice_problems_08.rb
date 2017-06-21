# practice_problems_08.rb
hsh = {
  first: ['the', 'quick'],
  second: ['brown', 'fox'],
  third: ['jumped'],
  fourth: ['over', 'the', 'lazy', 'dog']
}
VOWELS = 'aeiou'

hsh.each_value do |arr|
  arr.each do |word|
    letters = word.split(//)
    letters.each do |letter|
      puts letter if VOWELS.include?(letter)
    end
  end
end
