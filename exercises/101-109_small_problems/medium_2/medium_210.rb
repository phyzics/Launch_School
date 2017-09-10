# medium_210.rb - Sum Square - Square Sum
def sum_square_difference(num)
  sum_squared = (1..num).to_a.reduce(:+)**2
  squares_summed = (1..num).to_a.map! { |num| num ** 2}.reduce(:+)
  sum_squared - squares_summed
end

p sum_square_difference(3) == 22
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150

=begin
utp:
- compute diff b/w SUM(1..num)**2 and SUM(1**2..num**2)

=end
