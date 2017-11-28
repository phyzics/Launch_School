def fizzbuzz(num1, num2)
  result = []
  (num1..num2).each do |num|
    if num % 3 == 0 && num % 5 == 0
      result << 'FizzBuzz'
    elsif num % 3 == 0
      result << 'Fizz'
    elsif num % 5 == 0
      result << 'Buzz'
    else
      result << num.to_s
    end
  end
  result.join(', ')
end

p fizzbuzz(1, 15)
