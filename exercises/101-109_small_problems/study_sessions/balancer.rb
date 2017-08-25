# balancer.rb
require 'pry'
def balancer(str)
  return false unless str.count("(") == str.count(")")
  iterator = 0
  str.chars.each do |char|
    iterator += 1 if char == "("
    iterator -= 1 if char == ")"

    return false if iterator < 0
  end
  true
end

puts balancer(") hey there(")
puts balancer("(hi)")
puts balancer("(h(h(h)H(h)))")
puts balancer("(h(h)h)h)h(h")
