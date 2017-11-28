# easy_703.rb - Capitalize Words
def word_cap(str)
  str.split.map(&:capitalize).join(' ')
end

p word_cap('four score and seven')
p word_cap('the javaScript language')
p word_cap('this is a "quoted" word')
