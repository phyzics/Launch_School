# easy_104.rb - Divisors
def divisors(number)
  number_arr = []
  (1..number).each do |n|
    number_arr << n if number % n == 0
  end
  number_arr
end
