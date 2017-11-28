# easy_202.rb - Zipper
def zip(arr1, arr2)
  zip_array = []
  arr1.size.times do |idx|
    zip_array << [arr1[idx], arr2[idx]]
  end
  zip_array
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
=begin
alg:
- array.size times do |i|
  - ra << [a1[i], a2[i]]
- return ra
=end
