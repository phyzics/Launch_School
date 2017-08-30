# easy_403.rb - Leap Years (Part 1)
def leap_year?(year)
  if year % 400 == 0
    true
  elsif year % 100 == 0
    false
  elsif year % 4 == 0
    true
  else
    false
  end
end

p leap_year?(2016) #== true
p leap_year?(2015) #== false
p leap_year?(2100) #== false
p leap_year?(2400) #== true
p leap_year?(240000) #== true
p leap_year?(240001) #== false
p leap_year?(2000) #== true
p leap_year?(1900) #== false
p leap_year?(1752) #== true
p leap_year?(1700) #== false
p leap_year?(1) #== false
p leap_year?(100) #== false
p leap_year?(400) #== true

=begin
utp:
- /4, but not if also /100, unless /400
data:
-i: int
-o: boolean
ec:
- negatives
- validation
tc:
  leap_year?(2016) == true
  leap_year?(2015) == false
  leap_year?(2100) == false
  leap_year?(2400) == true
  leap_year?(240000) == true
  leap_year?(240001) == false
  leap_year?(2000) == true
  leap_year?(1900) == false
  leap_year?(1752) == true
  leap_year?(1700) == false
  leap_year?(1) == false
  leap_year?(100) == false
  leap_year?(400) == true
alg:
- if else conditionals using %
=end
