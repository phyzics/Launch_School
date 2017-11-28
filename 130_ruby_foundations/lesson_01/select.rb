# select.rb
def select(arr)
  counter = 0
  return_arr = []
  while counter < arr.size do
    value = yield(arr[counter])

    if value
      return_arr << arr[counter]
    end

    counter += 1
  end
  return_arr
end

array = [1, 2, 3, 4, 5]

p select(array) { |num| num.odd? }
p select(array) { |num| puts num }
p select(array) { |num| num + 1 }
