# medium_209.rb - Bubble Sort
def bubble_sort!(arr)
  l = arr.length
  loop do
    (1..l - 1).each do |idx|
      if arr[idx - 1] > arr[idx]
        arr[idx - 1], arr[idx] = arr[idx], arr[idx - 1]
      end
    end
    l -= 1
    break if l == 1
  end
  arr
end

p array = [5, 3]
p bubble_sort!(array)
p array == [3, 5]

p array = [6, 2, 7, 1, 4]
p bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

p array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
p bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

=begin
utp:
- iterates, compares consecutive elements
  - if a > b, then swap places
  - array is sorted once no more swaps are needed

method(arr)
  l = arr.length
  loop
    (0..l-1).each |idx|
      if arr[idx] > arr[idx + 1]
        a, b = b, a
      end
    end
    l -= 1
  break if l = 1
  end
end
=end
