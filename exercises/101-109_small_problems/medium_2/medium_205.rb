# medium_205.rb - Triangle Sides
def triangle(side1, side2, side3)
  return :invalid if side1 == 0 || side2 == 0 || side3 == 0
  average = ((side1 + side2 +side3) / 3)
  if ((side1 > side2 && side3) && (side1 > side2 + side3)) ||
     ((side2 > side1 && side3) && (side2 > side1 + side3)) ||
     ((side3 > side1 && side2) && (side3 > side1 + side2))
    :invalid
  elsif side1 == average && side2 == average && side3 == average
    :equilateral
  elsif side1 == side2 || side1 == side3 || side2 == side3
    :isosceles
  else
    :scalene
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid

=begin
utp:
- sum of smallest two > longest
- take 3 int as length of sides
  - return appropriate symbol describing triangle
data:
- i: integers
- o: symbol
tc:
  p triangle(3, 3, 3) == :equilateral
  p triangle(3, 3, 1.5) == :isosceles
  p triangle(3, 4, 5) == :scalene
  p triangle(0, 3, 3) == :invalid
  p triangle(3, 1, 1) == :invalid
alg:
- case guard against any 0

=end
