# advanced_106.rb - Fix the Bug
def my_method(array)
  if array.empty?
    []
  elsif array.length > 1
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end

p my_method([])
p my_method([3])
p my_method([3, 4])
p my_method([5, 6, 7])

# There was no conditional specified with the elsif keyword on line 5, and so
# it seems that elsif will automatically return 'nil' for the conditional,
# hence skipping over the else keyword.

# Seems my explanation was incorrect, but I did fix the bug!
