# medium_207.rb - Unlucky Days
def friday_13th(year)
  starting_date = Time.new(year, 1, 1)
  ending_date = Time.new(year, 12, 31)
  add_day = (60 * 60 * 24)
  counter = 0
  until starting_date == ending_date do
    counter += 1 if starting_date.friday? && starting_date.day == 13
    starting_date += add_day
  end
  counter
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2

=begin
utp:
- return number of friday the 13th in given year
- assume year > 1752, gregorian
data:
- i: integer
- o: integer
tc:
  p friday_13th(2015) == 3
  p friday_13th(1986) == 1
  p friday_13th(2019) == 2
alg:
-
=end
