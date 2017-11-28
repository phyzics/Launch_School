# easy_601.rb - Cute angles
require 'pry'
DEGREE = "\xC2\xB0"
MINUTE = "'"
SECOND = "\""

def dms(angle)
  degree, dot, post_dot = angle.to_s.partition('.')
  return "#{degree << DEGREE}00#{MINUTE}00#{SECOND}" if post_dot.empty?
  degree = format('%02d', degree)
  degree << DEGREE

  post_dot = post_dot.prepend('.').to_f*60
  minutes, dot, seconds = post_dot.to_s.partition('.')
  minutes = format('%02d', minutes)
  minutes << MINUTE

  seconds = seconds.prepend('.').to_f*60
  seconds = seconds.to_i.to_s
  seconds = format('%02d', seconds)
  seconds << SECOND

  "#{degree}#{minutes}#{seconds}"
end

puts dms(30) #== %(30°00'00")
puts dms(76.73) #== %(76°43'48")
puts dms(254.6) #== %(254°36'00")
puts dms(93.034773) #== %(93°02'05")
puts dms(0) #== %(0°00'00")
puts dms(360) #== %(360°00'00") || dms(360) == %(0°00'00")

=begin
utp:
- takes float (angle b/w 0 to 360), returns str (deg, min, sec)
  - deg = 60 min, min = 60 sec
- make sure rounding is close
- use leading zeroes for mins and sec
data:
- i: float
- o: string
tc:
  p dms(30) == %(30°00'00")
  p dms(76.73) == %(76°43'48")
  p dms(254.6) == %(254°36'00")
  p dms(93.034773) == %(93°02'05")
  p dms(0) == %(0°00'00")
  p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
alg:
- to_s, partition at decimal, save 1st and last object
- for last -- to_f, *60, repeat previous process
- build string
=end
