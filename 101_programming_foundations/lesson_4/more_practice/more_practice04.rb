# more_practice04.rb
# 1
ages = {
  "Herman" => 32,
  "Lily" => 30,
  "Grandpa" => 5843,
  "Eddie" => 10,
  "Marilyn" => 22,
  "Spot" => 237
}

smallest_value = 10_000

ages.each_value do |age|
  current_value = age
  if current_value < smallest_value
    smallest_value = current_value
  end
end
p smallest_value

# 2
ages = {
  "Herman" => 32,
  "Lily" => 30,
  "Grandpa" => 5843,
  "Eddie" => 10,
  "Marilyn" => 22,
  "Spot" => 237
}

p ages.values.min
