# medium2.rb

# 1
# => at the beginning of the loop the id's remain the same, so a_outer_id, etc,
# => are equal to _a_outer_inner_id, etc. After the reassignments, the ids of
# => all the variables are different. a_inner, etc, are all set to these ids,
# => and thsoe values are equal to a_inner_id, etc.

# 2
# => My guess was correct

# 3
# => The code will display the two strings with "pumpkins" as the value of
# => "my_string", and "[pumpkings, rutabaga]" for my_array. This is because
# => the << mutates the caller (the argument passed through), while += does not.

# 4
# => Same deal. "rutabaga" is being appended to a_string_param which still
# => references the same object as "my_string", and so the caller is mutated.
# => In the case of the array, "an_array_param" is set to a new object and so
# => "my_array" is not mutated.

# 5
def color_valid(color)
  color == "blue" || color == "green"
end
