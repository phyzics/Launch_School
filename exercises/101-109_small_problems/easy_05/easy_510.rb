# easy_510.rb - Bannerizer

def bannerizer(str)
  top_and_bottom = "+--+"
  sides = "|  |"
  middle = "| #{str} |"

  str_size = str.length
  top_and_bottom.insert(2, ("-" * str.length))
  sides.insert(2, (" " * str.length))

  puts top_and_bottom
  puts sides
  puts middle
  puts sides
  puts top_and_bottom
end

bannerizer('To boldly go where no one has gone before.')
bannerizer('')
bannerizer("What's up, man?!")

=begin
alg:
- get the length of the string, and increase the top and bottom margins by using
  insertion method

=end
