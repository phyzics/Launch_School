# easy_708.rb - Multiply Lists
def multiply_list(arr1, arr2)
  return_arr = []
  arr1.each_with_index { |_, idx| return_arr << (arr1[idx] * arr2[idx]) }
  return_arr
end

def multiply_list_with_zip(arr1, arr2)
  arr1.zip(arr2) { |arr| arr }
end

p multiply_list_with_zip([3, 5, 7], [9, 10, 11])
