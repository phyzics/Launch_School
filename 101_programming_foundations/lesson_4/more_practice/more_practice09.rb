# more_practice09.rb
def titleize(str)
str_array = str.split
str_array.each { |substr| substr.capitalize! }
str = str_array.join(" ")
end

words = "the flintstones rock"

p titleize(words)
