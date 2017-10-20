# easy_106.rb - Anagrams
class Anagram
  attr_reader :word

  def initialize(string)
    @word = string.downcase
  end

  def match(arr)
    word_arr = letters(word)
    arr.select { |str| word_arr == letters(str) && word != str.downcase }
  end

  private

  def letters(str)
    str.downcase.chars.sort
  end
end
