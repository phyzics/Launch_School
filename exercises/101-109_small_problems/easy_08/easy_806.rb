# easy_806.rb - fizzbuzz
def fizzbuzz(start, last)
  return_arr = (start..last).map do |num|
    if num % 3 == 0 && num % 5 == 0
      "FizzBuzz"
    elsif num % 3 == 0
      "Fizz"
    elsif num % 5 == 0
      "Buzz"
    else
      num
    end
  end
  return_arr.join(', ')
end

puts fizzbuzz(1, 15)
