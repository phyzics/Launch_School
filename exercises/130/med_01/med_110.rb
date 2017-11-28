# med_110.rb - Buuble Sort with Blocks
require 'pry'
def bubble_sort!(arr)
  l = arr.length
  loop do
    (1..l - 1).each do |idx|
      if block_given?
        block = yield(arr[idx - 1], arr[idx])
        arr[idx - 1], arr[idx] = arr[idx], arr[idx - 1] if !block
      elsif arr[idx - 1] > arr[idx]
        arr[idx - 1], arr[idx] = arr[idx], arr[idx - 1]
      end
    end
    l -= 1
    break if l == 1
  end
  arr
end

array = [5, 3, 7]
bubble_sort!(array) { |first, second| first >= second }
p array #== [7, 5, 3]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = [6, 12, 27, 22, 14]
bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
p array == [14, 22, 12, 6, 27]

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array)
p array == %w(Kim Pete Tyler alice bonnie rachel sue)

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
p array == %w(alice bonnie Kim Pete rachel sue Tyler)
