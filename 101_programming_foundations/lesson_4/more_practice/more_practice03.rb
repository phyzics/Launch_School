# more_practice03.rb
# 1
ages = {
  "Herman" => 32,
  "Lily" => 30,
  "Grandpa" => 402,
  "Eddie" => 10
}

ages = ages.each_with_object({}) do |(k, v), hash|
  if v >= 100
    ages.delete(k)
  else
    hash[k] = v
  end
end

p ages

# 2
ages = {
  "Herman" => 32,
  "Lily" => 30,
  "Grandpa" => 402,
  "Eddie" => 10
}

ages.delete_if { |k, v| v >= 100 }
p ages

# 3
ages = {
  "Herman" => 32,
  "Lily" => 30,
  "Grandpa" => 402,
  "Eddie" => 10
}

ages.keep_if { |k, v| v < 100 }
p ages

# 4
ages = {
  "Herman" => 32,
  "Lily" => 30,
  "Grandpa" => 402,
  "Eddie" => 10
}

ages.select! { |k, v| v < 100 }
p ages
