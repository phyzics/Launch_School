# easy_707.rb - Multiplicative Average
def show_multiplicative_average(arr)
  value = (arr.map(&:to_f).reduce(:*) / arr.size)
  "The result is #{format("%.3f", value)}"
end

p show_multiplicative_average([3, 5])
p show_multiplicative_average([6])
p show_multiplicative_average([2, 5, 7, 11, 13, 17])
