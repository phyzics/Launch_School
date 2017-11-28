# easy_906.rb - How long are you?
def word_lengths(str)
  str.split.map { |s| s + " #{s.size}" }
end

p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") ==
    ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
    ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []

=begin
utp:
- takes str, returns arr with all words with ' size' appended
- assume only one space b/w words, and non spaces == words
data:
- i: string
- o: array of strings
tc:
  word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

  word_lengths("baseball hot dogs and apple pie") ==
    ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

  word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

  word_lengths("Supercalifragilisticexpialidocious") ==
    ["Supercalifragilisticexpialidocious 34"]

  word_lengths("") == []
alg:
-

=end
