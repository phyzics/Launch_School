# easy_402.rb - What Century is That?
def century(year)
  dates = year.divmod(100)
  current_century = dates[0]
  current_century += 1 if dates[1] >= 1

  suffix = if current_century % 100 == 11 ||
              current_century % 100 == 12 ||
              current_century % 100 == 13
             'th'
           elsif current_century % 10 == 1
             'st'
           elsif current_century % 10 == 2
             'nd'
           elsif current_century % 10 == 3
             'rd'
           else
             'th'
           end

  "#{current_century}#{suffix}"
end

p century(2000)
p century(2001)
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'

=begin
utp:
- takes an integer and returns string stating century
 - must use accurate st, nd, rd, or th
data:
- i: integer
- o: string
ec:
- validation
tc:
  century(2000) == '20th'
  century(2001) == '21st'
  century(1965) == '20th'
  century(256) == '3rd'
  century(5) == '1st'
  century(10103) == '102nd'
  century(1052) == '11th'
  century(1127) == '12th'
  century(11201) == '113th'
alg:
- determine the century by dividing by 100; we use modulo of >= 1 to see if is
  the century above the quotiant (divmod)
- use string interpolation and concatenation
=end
