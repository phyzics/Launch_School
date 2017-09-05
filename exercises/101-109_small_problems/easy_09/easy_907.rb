# easy_907.rb - Name Swapping
def swap_name(name)
  name.split.reverse.join(', ')
end

p swap_name('Joe Roberts')
