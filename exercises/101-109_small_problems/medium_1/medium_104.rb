# medium_104.rb - 1000 Lights

# "o" == off, "*" == on

def find_last_lights(toggles=1)
  light_arr = set_up_lights(toggles)
  counter = 1
  toggles.times do
    light_arr.map! do |light|
      if (light.to_i) % counter == 0
        light.is_a?(String) ? light.to_i : light.to_s
      else
        light
      end
    end
    counter += 1
  end
  light_arr.select { |light| light.is_a?(String) }
end

def set_up_lights(number)
  (1..number).to_a
end

p find_last_lights(1000)

=begin
utp:
- switches #'ed 1..1000
- 1:1, light starts off
- go back and toggle even
- then odd
- 1000 repetitions
- which are on at the end
- never turn 1 off
data:
- convert a range to an array with 1000 elements
alg:
- set up a lightswitch board
  - use a range of 1..number inputted, then turn these all to strings to be
    "off"
- set up a method that takes the number of toggles you want
  - toggles.times it goes through, cehcking if the element.to_s & iter == 0
    if it does, toggle it
  - at the end, use select to find the numbers that are integers, and there
    is your answer

- each round, if ind
=end
