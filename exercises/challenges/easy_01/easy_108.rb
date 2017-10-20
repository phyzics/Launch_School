# easy_108.rb - Word Count
class Phrase
  attr_reader :phrase

  def initialize(string)
    @phrase = string.downcase
    @words = create_phrase_array
  end

  def word_count
    word_hsh = @words.uniq.each_with_object({}) { |w, hsh| hsh[w] = 0 }
    @words.each { |w| word_hsh[w] += 1 }
    word_hsh
  end

  private

  def create_phrase_array
    phrase.split(/[ ,]/).map { |word| word[/\b[a-z'\d]+\b/] }.compact
  end
end
