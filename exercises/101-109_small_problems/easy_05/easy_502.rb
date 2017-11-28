# easy_502.rb - After Midnight (Part 1)
def time_of_day(minutes)
  minutes %= 1440
  hours, minutes = minutes.divmod(60)

  hours = hours.to_s
  minutes = minutes.to_s

  hours.prepend('0') if hours.to_i < 10
  minutes.prepend('0') if minutes.to_i < 10

  "#{hours}:#{minutes}"
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"

=begin
utp:
- take minute format (+ after mid, - before mid), return in hh:mm format
- any integer, no Time or Date classes
data:
- i: integer
- o: str
ec:
- validation, etc.
tc:
  time_of_day(0) == "00:00"
  time_of_day(-3) == "23:57"
  time_of_day(35) == "00:35"
  time_of_day(-1437) == "00:03"
  time_of_day(3000) == "02:00"
  time_of_day(800) == "13:20"
  time_of_day(-4231) == "01:29"
alg:
- need to account for days first and shave them off
  - then we account for hours and minutes
=end
