# medium_206.rb - Tri-Angles
def triangle(ang1, ang2, ang3)
  angles = [ang1, ang2, ang3]
  largest = angles.max
  case
  when angles.include?(0), angles.reduce(:+) != 180
    :invalid
  when largest == 90
    :right
  when largest < 90
    :acute
  when largest > 90
    :obtuse
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid

=begin
utp:
- sum of angles = 180, no 0
- return appropriate symbol
- int, spec in degree
data:
- i: integers
- o: symbol
tc:
  p triangle(60, 70, 50) == :acute
  p triangle(30, 90, 60) == :right
  p triangle(120, 50, 10) == :obtuse
  p triangle(0, 90, 90) == :invalid
  p triangle(50, 50, 50) == :invalid
alg:
- case statement, return symbol
=end
