# easy_503.rb - After Midnight (Part 2)
MINUTES_IN_DAY = 1440

def after_midnight(time)
  time_arr = time.split(':').map(&:to_i)
  time_arr[0] = time_arr[0] * 60 % MINUTES_IN_DAY
  time_arr.reduce(:+)
end

def before_midnight(time)
  time_arr = time.split(':').map(&:to_i)
  time_arr[0] *= 60
  (MINUTES_IN_DAY - time_arr.reduce(:+)) % MINUTES_IN_DAY
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0

=begin
utp:
- takes 24h format str, returns minutes in int before or after midnight
  - 2 methods
ec:
- validation, etc
data:
- i: string
- o: integer
tc:
  after_midnight('00:00') == 0
  before_midnight('00:00') == 0
  after_midnight('12:34') == 754
  before_midnight('12:34') == 686
  after_midnight('24:00') == 0
  before_midnight('24:00') == 0
alg:
- use constants to get minutes in a day
- convert by spitting at ':'
- first * 60, add to second, perform - if before midnight

=end
