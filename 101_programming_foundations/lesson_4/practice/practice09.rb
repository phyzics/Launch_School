# practice09.rb
{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

# => #map returns a new array with the element 'bear' since only 'bear' is true
# => for the evaluation.

# => The above is incorrect; #map will ALWAYS return a value regardless of
# => the evaluation, and since 'ant' is not > 3, it returns 'nil' for 'false'
# => More specifically, it returns 'nil' because none of the conditions in the
# => if statement evaluate to true when 'ant' is the element being evaluated
