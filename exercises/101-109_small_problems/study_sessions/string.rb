# string.rb
def stringy(int)
  number = []
  int.times do
    number.length.even? ? number << '1' : number << '0'
  end
  number.join
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
