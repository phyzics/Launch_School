# easy2.rb

=begin
=end
# 1
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.include?("Spot")
ages.key?("Spot")
ages.has_key?("Spot")
ages.fetch("Spot", "It ain't here, brudduh")

# 2
munsters_description = "The Munsters are creepy in a good way."

munsters_description.capitalize!
munsters_description.swapcase!
munsters_description.downcase!
munsters_description.upcase!

# 3
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
ages.merge!(additional_ages)

# 4
advice = "Few things in life are as important as house training your pet dinosaur."
advice.include?("Dino")

# 5
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# 6
flintstones << "Dino"

#7
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.insert(-1, 'Dino', 'Hoppy')

# 8
advice = "Few things in life are as important as house training your pet dinosaur."
advice.slice!(0..38)
# or
advice.slice!("Few things in life are as important as ")
# using #slice would return the desired value but would not mutate the caller

# 9
statement = "The Flintstones Rock!"
statement.scan('t').length

# 10
title = "Flintstone Family Members"
title.center(40)
