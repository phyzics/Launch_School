# medium1.rb

# 1
10.times { |time| puts (' ' * time) + 'The Flintstones Rock!' }

# 2
# => Because you are trying to add a String to an Integer.

puts "the value of 40 + 2 is " + "#{(40 + 2)}"
puts "the value of 40 + 2 is " + (40 + 2).to_s

# 3
def factors(number)
  dividend = number
  divisors = []
  while dividend > 0 do
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  divisors
end

# Bonus 1: 'number % dividend == 0' is used to make sure there is no remainder
# => after the division, which would mean that 'dividend' is indeed a factor of
# => number

# Bonus 2: a method returns the last expression and so by putting 'divisors'
# => at the end, Alan's method will return the array of divisors that is
# => referenced by the 'divisors' variable

# 4
# => Yes. In the first case she is mutating the caller ('buffer') by shoveling
# => in 'new_element'. This will modify the argument passed through the method.
# => In the second example, she is creating a variable within the method scope
# => and assigning 'input_array + [new_element]' to it, thus pointing to a new
# => space in memory (a new object).


# 5
# => The local variable 'limit' cannot be accessed by the method 'fib' unless
# => it is explicitly passed through. If 'limit' was changed to a constant
# => ('LIMIT') then it could be accessed by the method without passing it through,
# => but then it should not be changed. If Ben is intending 'limit' to be changeable,
# => then he should set an argument that he can then pass it through.

# 6

def not_very_tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
not_very_tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# 7
# => the integer 34 should output since answer (which is 42) - 8 = 34

# 8

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

mess_with_demographics(munsters)

puts munsters

# => Yes, because inside of the method we are not setting a variable, but
# => changing the value of the "age" and "gender" keys

# 9
# =>  It should evaluate out to "paper"

# 10
# => it should be "no" because foo evaluates to "yes", and since "yes" == "no"
# => is false, bar will return "no"
