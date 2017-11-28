# easy_610 - right Triangles
def triangle(num=2)
  start = 1
  num.times do
    puts("#{'*'*start}".rjust(num))
    start += 1
  end
end

def upsidedown_triangle(num=2)
  start = num
  num.times do
    puts ("#{'*'*start}".rjust(num))
    start -= 1
  end
end

def left_triangle(num=2)
  start = 1
  num.times do
    puts("#{'*'*start}".ljust(num))
    start += 1
  end
end

def upsidedown_left_triangle(num=2)
  start = num
  num.times do
    puts("#{'*'*start}".ljust(num))
    start -= 1
  end
end

def choose_triangle(orient, num)
  case orient
  when 1 then triangle(num)
  when 2 then upsidedown_triangle(num)
  when 3 then left_triangle(num)
  when 4 then upsidedown_left_triangle(num)
  end
end

choose_triangle(1, 5)
choose_triangle(3, 5)
choose_triangle(2, 5)
choose_triangle(4, 5)

=begin
utp:
- takes +integer, displays rtriangle whose sides have int stars
data:
- i: integer
- o: strings
tc:
  5, 9
alg:
- 5.times puts *
  - iterate up to n how many we print each time
  - rjust n

=end
