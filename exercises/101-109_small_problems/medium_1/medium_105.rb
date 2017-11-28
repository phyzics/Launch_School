# medium_105.rb - Diamonds
def diamond(num, hollow=0)
  str_arr = []
  (1..num).each { |count| str_arr << ('*' * count) if count.odd? }
  (1..num).reverse_each { |count| str_arr << ('*' * count) if count.odd? }
  str_arr.slice!(str_arr.size/2)
  if hollow == 0
    print_diamond(str_arr, num)
  else
    str_arr
  end
end

def hollow_diamond(num)
  str_arr = diamond(num, 1)
  str_arr.map! do |star|
    if star.length == 1
      star
    else
      "#{star[0]}" + "#{' ' * (star.size - 2)}" + "#{star[-1]}"
    end
  end
  print_diamond(str_arr, num)
end

def print_diamond(arr, num)
  arr.each { |star| puts(star.center(num)) }
end


diamond(1)
diamond(3)
hollow_diamond(9)

=begin
utp:
- display 4 pointed diamond in an nxn grid
  - n is odd integer (assume)
data:
- i: int
- o: str
tc:
  p diamond(1)
  p diamond(3)
  p diamond(9)
alg:
- each line increases by 2 from the previous
  - loop through range, and use each to << '*' * r_num if r_num is odd
  - call each on the return array, putsing with center


- build an array of strings, and use each to puts each, center(num)

- have the strings as nested arrays, and puts with center
=end
